import 'package:daily_rollover_proapp/authService.dart';
import 'package:daily_rollover_proapp/components/imageTile.dart';
import 'package:daily_rollover_proapp/components/loginTextField.dart';
import 'package:daily_rollover_proapp/components/myButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class loginPage extends StatefulWidget {
  //final Function()? onTap;
  loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;
  void SignInUser() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Invalid Email Address",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Invalid Password",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Invalid Details",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Contact twoplusafrica@gmail.com for Login Credentials",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,

                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: _obscureText,

                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 50,
                ),
                MyButton(
                  onTap: SignInUser,
                  text: "Sign In",
                ),
                SizedBox(
                  height: 50,
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
