import 'package:daily_rollover_proapp/components/textDisplay.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';


class termsScreen extends StatelessWidget {
  const termsScreen({Key? key}) : super(key: key);
  void signUserOut(){
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Terms Of Service',
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
        body: SingleChildScrollView(
          child:Column(
              children: [
                textDisplay(
                  text:
                      "These terms and conditions outline the rules and regulations for the use of the application,created by TwoPlus Community. This application is only informative tool and must be used just for fun. We post various sports prediction that represent our opinion regarding the eventual outcome of those games. We do not encourage or support betting and gambling. By continuing to use app, you fully understand that this is only informative service and you accept that we will not be any in what responsible for your personal actions. Everyone who uses the app is 100% responsible for his actions and for obeying the applicable laws in his country.  Act responsible! 18+ only. Not designed for children! If you want to review the Terms and Conditions later you can do that at any time in the app menu. If you have any questions or concerns regarding these Terms and Terms or Agreement please contact Support@Twoplus.africa",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      backgroundColor: Colors.black,
                      minimumSize: const Size(50, 70),
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

        ),
      );
  }
}
