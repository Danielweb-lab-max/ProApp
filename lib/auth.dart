import 'package:daily_rollover_proapp/screens/loginPage.dart';
import 'package:daily_rollover_proapp/screens/welcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            // return IndexScreen();
            return WelcomeScreen();
          }else{
            return loginPage();
          }
        },
      ),
    );
  }
}
