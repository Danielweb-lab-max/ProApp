import 'package:daily_rollover_proapp/components/textDisplay.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class legalScreen extends StatelessWidget {
  const legalScreen({Key? key}) : super(key: key);
  void signUserOut(){
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Legal Declaration',
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
          child: Container(
            decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomRight,
              //     stops: [0.5,1.1],
              //     colors: [Colors.blue,Colors.white]
              //
              // ),
            ),
            child: Column(
              children: [
                textDisplay(
                  text:
                  "1.Our application is not directed to online gambling. It is only application for entertainment and fun between friends. We do not support in any way gambling so understand that gambling involves risks. 2. Whilst we do are upmost to offer good analyze and information we cannot be held responsible for any choice you make outside our application that may incur as a result of gambling. 3. We do our best for all the info that we provide on this app, however from time to time, mistakes will be made and we will not be held liable. Please check any stats or info which you are unsure how accurate they are. 4. No guarantees are made with regards to results or financial gain. All forms of betting carry financial risks and it is down to individual decisions. 5. We cannot be held responsible for any losses that may incur as a result of following the betting tips provided on this application because we share our opinion (analyze tips) for fun with friends. 6. The material contained on this site is intended to inform and educate reader and in no way represents an inducement to gamble legally or illegally. 7. Past performance do not guarantee success in the future. 8. While we do our best to find the best for all our tips we cannot ensure they are always accurate as betting odds fluctuate from one minute to the next. 9. ALL TIPS are subject to change and were correct at the time of publishing. 10. We are not to be held liable to you(whether under the law of contract, the law of torts or otherwise) in relation to the contents of , or use of, or otherwise in connection with this application. ",
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
        ),
      ),
    );;
  }
}
