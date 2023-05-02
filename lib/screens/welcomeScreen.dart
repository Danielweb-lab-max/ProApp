import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void signUserOut(){
    FirebaseAuth.instance.signOut();

  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xFF80FF72),
        appBar: AppBar(
          elevation: 3.0,
          title: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Winning is just a tap away!...',
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/view_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        backgroundColor: Colors.black,
                        minimumSize: const Size(50, 70),
                      ),
                      child: const Text(
                        "TODAY'S TICKET",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),

                    //borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/terms_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        backgroundColor: Colors.black,
                        minimumSize: const Size(50, 50),
                      ),
                      child: const Text(
                        "TERMS OF USE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),

                    //borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/legal_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        backgroundColor: Colors.black,
                        minimumSize: const Size(50, 50),
                      ),
                      child: const Text(
                        "LEGAL DISCLAIMER",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),

                    //borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                title: const Center(
                                  child: Text(
                                    'COMING SOON',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                backgroundColor: const Color(0xFF0573eb),
                                actions: <Widget>[
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      // style: ElevatedButton.styleFrom(
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.circular(30.0),
                                      //   ),
                                      //   backgroundColor: Colors.lightGreen,
                                      //   // minimumSize: Size(30, 30),
                                      //   // maximumSize: Size(170, 50),
                                      //   fixedSize: Size(70, 40),
                                      //
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(200,
                                            50), // sets the width and height of the button
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20), // sets the circular border radius
                                        ),
                                        backgroundColor:
                                        const Color(0xFF38d302),
                                      ),
                                      child: const Center(
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                              fontSize: 22,
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        backgroundColor: Colors.black,
                        minimumSize: const Size(50, 50),
                      ),
                      child: const Text(
                        "TELEGRAM",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),

                    //borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(


                      onPressed: () async {
                        const url = 'https://bit.ly/40zQgPm';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        backgroundColor: Colors.black,
                        minimumSize: const Size(50, 50),
                      ),
                      child: const Text(
                        "Check US Out!!!",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

      ),
    );
  }
}
