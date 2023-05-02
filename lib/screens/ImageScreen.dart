import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);


  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  final _firestore = FirebaseFirestore.instance;
  void messagesStream() async {
    await for (var snapshot in _firestore.collection('images').snapshots()) {
      for (var message in snapshot.docs) {
        if (kDebugMode) {
          print(message.data());
        }
      }
    }
  }
  void signUserOut(){
    FirebaseAuth.instance.signOut();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Winning is just a tap away!...',
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 70),
              ),
            ],
            totalRepeatCount: 1000,
            pause: const Duration(milliseconds: 100),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){
            signUserOut();
          }, icon: Icon(
            Icons.logout_outlined,
          ),)
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomCenter,
              //       stops: [0.5, 1.2],
              //       colors: [Colors.green, Colors.lightBlueAccent]),
              // ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [

                    StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('images').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final messages = snapshot.data!.docs;
                          List<Padding> messageWidgets = [];
                          for (var message in messages) {
                            final imageValue =
                            message.get('img');
                            //final imgText = message.get('imgText');


                            final messageWidget = Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                children: [

                                  Image(image: NetworkImage('$imageValue')
                                  ),


                                ],
                              ),
                            );

                            messageWidgets.add(messageWidget);
                          }
                          return Expanded(
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2.0),
                              children: messageWidgets,
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Material(
                        color: Colors.black,
                        //borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/");
                            // _showRewardedAd();
                          },
                          height: 20,
                          minWidth: 40,
                          child: const Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
