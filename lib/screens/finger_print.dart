// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

// ------------------------------------ record finger print
class RecordFingerPrint extends StatefulWidget {
  const RecordFingerPrint({Key? key}) : super(key: key);

  @override
  _RecordFingerPrintState createState() => _RecordFingerPrintState();
}

class _RecordFingerPrintState extends State<RecordFingerPrint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Register Fingerprint',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocalAuthScreen()),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({Key? key}) : super(key: key);

  @override
  State<LocalAuthScreen> createState() => _LocalAuthScreenState();
}


class RegisteredPerson {
  String name;

  RegisteredPerson({required this.name});
}


class _LocalAuthScreenState extends State<LocalAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  List<RegisteredPerson> registeredPersons = [];

  Future<void> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate',
        options: const AuthenticationOptions(useErrorDialogs: false),
      );

      if (didAuthenticate) {
        _showRegisterDialog();
      }
    } on PlatformException catch (e) {
      if (e.code == 'notEnrolled') {
        // Handle no hardware
      } else if (e.code == 'lockedOut' || e.code == 'permanentlyLockedOut') {
        // Handle locked out
      } else {
        // Handle other errors
      }
    }
  }

  void _showRegisterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = '';

        return AlertDialog(
          title: Text('Register Fingerprint'),
          content: TextField(
            onChanged: (value) {
              name = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  registeredPersons.add(RegisteredPerson(name: name));
                });
                Navigator.of(context).pop();
              },
              child: Text('Register'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint Auth App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Fingerprint Auth App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Get Authenticated'),
              onPressed: () => authenticate(),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Registered Persons:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: registeredPersons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(registeredPersons[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
