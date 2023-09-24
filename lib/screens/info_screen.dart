// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';


// -------------------------------------- dynamics of biometrics in preventing fraud and identity theft
class BiometricsInfoScreen extends StatefulWidget {
  @override
  _BiometricsInfoScreenState createState() => _BiometricsInfoScreenState();
}

class _BiometricsInfoScreenState extends State<BiometricsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometrics and Fraud Prevention'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Biometrics and Fraud Prevention',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Biometrics involves the use of unique physical or behavioral characteristics to verify a person\'s identity. These characteristics include fingerprints, facial features, iris patterns, voice, and more. Utilizing biometrics in security measures significantly enhances fraud prevention and reduces identity theft risks.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Key Advantages of Biometrics in Fraud Prevention:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            _buildBulletPoint(
                '1. Unique Identification: Biometrics offer a highly accurate and unique identification method, making it difficult for fraudsters to replicate.'),
            _buildBulletPoint(
                '2. Non-Transferable: Biometric traits are non-transferable, ensuring that individuals must be physically present for authentication.'),
            _buildBulletPoint(
                '3. Multi-factor Authentication: Biometrics can be combined with other authentication methods for stronger security, such as passwords or PINs.'),
            SizedBox(height: 16.0),
            Text(
              'Popular Biometric Authentication Methods:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            _buildBulletPoint(
                '1. Fingerprint Recognition: Analyzing fingerprint patterns for authentication.'),
            _buildBulletPoint(
                '2. Facial Recognition: Verifying an individual\'s identity based on facial features.'),
            _buildBulletPoint(
                '3. Iris Recognition: Using iris patterns for authentication purposes.'),
            _buildBulletPoint(
                '4. Voice Recognition: Authenticating individuals based on their unique voice patterns.'),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
