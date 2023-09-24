// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'vision_detector_views/face_detector_view.dart';

// ----------- screens

import 'screens/rec_audio.dart';
import 'screens/passwrd_screen.dart';
import 'screens/finger_print.dart';
import 'screens/info_screen.dart';
import 'screens/biometricsanalysis.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Authentication Evaluation',
      home: const BiometricAuthenticationEvaluationScreen(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BiometricAuthenticationEvaluationScreen extends StatelessWidget {
  const BiometricAuthenticationEvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometric Authentication Evaluation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: <Widget>[
            Image.asset('assets/images/topbanner.png'),
          ]), //Text

          Text("App to Record Multiple Bio"),
          // Card for recording fingerprint recognition
          SizedBox(height: 20),
          SizedBox(height: 20),
          Card(
            child: ListTile(
              title: Text('Record Password Secret 🔐'),
              onTap: () {
                // Navigate to the screen for recording fingerprint recognition
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PasswordScreen()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Record Fingerprint Recognition 👇'),
              onTap: () {
                // Navigate to the screen for recording fingerprint recognition
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RecordFingerPrint()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Record Facial Recognition 😄'),
              onTap: () {
                // Navigate to the screen for recording fingerprint recognition
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FaceDetectorView()),
                );
              },
            ),
          ),

          // Card for recording voice recognition
          Card(
            child: ListTile(
              title: Text('Record Voice Recognition 🔊'),
              onTap: () {
                // Navigate to the screen for recording voice recognition
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AudioRecorderUI()),
                );
              },
            ),
          ),

          // Card for viewing audio auth
          Card(
            child: ListTile(
              title: Text('Dynamics of biometrics 📂'),
              onTap: () {
                // Navigate to the screen for viewing authentication accuracies
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BiometricsInfoScreen()),
                );
              },
            ),
          ),
          // Card for analysis
          Card(
            child: ListTile(
              title: Text('Biometric authentication Analysis.🏫'),
              onTap: () {
                // Navigate to the screen for viewing authentication accuracies
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BiometricAuthenticationAnalysisScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


