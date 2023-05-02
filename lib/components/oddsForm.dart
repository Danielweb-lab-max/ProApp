import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_rollover_proapp/components/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class oddsForm extends StatefulWidget {
  const oddsForm({Key? key}) : super(key: key);
  @override
  State<oddsForm> createState() => _oddsFormState();
}

class _oddsFormState extends State<oddsForm> {
  final aboutImage = TextEditingController();
  String imgUrl='';
  void addDetails() async{
    String imgText=aboutImage.text.trim();
    await FirebaseFirestore.instance.collection('images').add({
      'imgText':imgText,
      'img':imgUrl,

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          myTextField(
            controller: aboutImage,
            hintText: 'Image',
            obscureText: false,
          ),
          IconButton(
            onPressed: () async {
              ImagePicker imagePicker = ImagePicker();

              XFile? file =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              // print('${file?.path}');
              if (file == null) return;
              String uniqueFileName =
                  DateTime.now().millisecondsSinceEpoch.toString();
              Reference referenceRoot = FirebaseStorage.instance.ref();
              Reference referenceDirImages = referenceRoot.child('images');
              Reference referenceImageToUpload =
                  referenceDirImages.child(uniqueFileName);
              try {
                await referenceImageToUpload.putFile(File(file!.path));
                imgUrl=await referenceImageToUpload.getDownloadURL();
              } catch (error) {}
            },
            icon: const Icon(
              Icons.camera_alt_sharp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),

            //borderRadius: BorderRadius.circular(10),
            child: ElevatedButton(
              onPressed: () {
                if(imgUrl.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload Image!"),));
                  return;
                }
                addDetails();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
                backgroundColor: Colors.black,
                minimumSize: const Size(50, 50),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
