import 'dart:io';
import 'package:dating_app/authenticationScreen/login_screen.dart';
import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid)
  {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAEcaThoh_Q1jQpxgEcLa7FlYhmQXC9rHs",
          authDomain: "tinderclone-bc291.firebaseapp.com",
          projectId: "tinderclone-bc291",
          storageBucket: "tinderclone-bc291.appspot.com",
          messagingSenderId: "1074079423860",
          appId: "1:1074079423860:web:d5832451aafa597698e021",
          measurementId: "G-K2K47RQXQX"
      )
    );
  }
  else
  {
    await Firebase.initializeApp();
  }

  Get.put(AuthenticationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dating App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

