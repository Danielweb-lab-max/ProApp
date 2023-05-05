import 'package:daily_rollover_proapp/auth.dart';
import 'package:daily_rollover_proapp/screens/ImageScreen.dart';
import 'package:daily_rollover_proapp/screens/legalScreen.dart';
import 'package:daily_rollover_proapp/screens/loginPage.dart';
import 'package:daily_rollover_proapp/screens/termsScreen.dart';
import 'package:daily_rollover_proapp/screens/welcomeScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//
//   print("Handling a background message: ${message.messageId}");
// }


void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // if (Firebase.apps.isEmpty) {
  //
  //   await Firebase.initializeApp(
  //     name: 'Betap-01',
  //
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   ).whenComplete(() {
  //     if (kDebugMode) {
  //       print("completedAppInitialize");
  //     }
  //   });
  // }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //FirebaseMessaging messaging = FirebaseMessaging.instance;
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // print('User granted permission: ${settings.authorizationStatus}');
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}'s);
  //
  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),

        '/legal_screen': (context) => const legalScreen(),
        '/terms_screen': (context) => const termsScreen(),
        // '/odds_screen': (context) => const oddsScreen(),
        '/view_screen': (context) => const ImageScreen(),
      },
    );
  }
}

