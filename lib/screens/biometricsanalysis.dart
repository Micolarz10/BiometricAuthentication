import 'package:flutter/material.dart';

// -------------------- biometric analysis
class BiometricAuthenticationAnalysisScreen extends StatefulWidget {
  @override
  _BiometricAuthenticationAnalysisScreenState createState() =>
      _BiometricAuthenticationAnalysisScreenState();
}

class _BiometricAuthenticationAnalysisScreenState
    extends State<BiometricAuthenticationAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometric Authentication Analysis'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Fingerprint Authentication'),
            subtitle: Text('Enhanced Security and Convenience'),
            trailing: Icon(Icons.fingerprint),
            onTap: () {
              // Display details and analysis for fingerprint authentication
              _showBiometricDetails(context, 'Fingerprint Authentication',
                  'Fingerprint authentication provides a high level of security by leveraging unique fingerprint patterns. It offers convenience to users, making it a popular choice for mobile devices and secure access points.');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Facial Recognition'),
            subtitle: Text('Advanced Security with User Convenience'),
            trailing: Icon(Icons.face),
            onTap: () {
              // Display details and analysis for facial recognition
              _showBiometricDetails(context, 'Facial Recognition',
                  'Facial recognition uses distinct facial features to authenticate users. It offers a balance between security and user convenience, making it widely adopted in various applications.');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Iris Scanning'),
            subtitle: Text('Highly Secure Biometric Authentication'),
            trailing: Icon(Icons.remove_red_eye),
            onTap: () {
              // Display details and analysis for iris scanning
              _showBiometricDetails(context, 'Iris Scanning',
                  'Iris scanning provides one of the highest levels of security in biometric authentication. It analyzes unique patterns in the iris of the eye, making it extremely difficult to replicate.');
            },
          ),
          // ..........
          // Table for biometric authentication comparison
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('Biometric Type'))),
                    TableCell(child: Center(child: Text('Security'))),
                    TableCell(child: Center(child: Text('Convenience'))),
                    TableCell(child: Center(child: Text('Popularity'))),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                        child:
                            Center(child: Text('Fingerprint Authentication'))),
                    TableCell(child: Center(child: Text('High'))),
                    TableCell(child: Center(child: Text('High'))),
                    TableCell(child: Center(child: Text('Widely Adopted'))),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('Facial Recognition'))),
                    TableCell(child: Center(child: Text('Medium to High'))),
                    TableCell(child: Center(child: Text('Medium'))),
                    TableCell(child: Center(child: Text('Widely Adopted'))),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('Iris Scanning'))),
                    TableCell(child: Center(child: Text('Very High'))),
                    TableCell(child: Center(child: Text('Medium to High'))),
                    TableCell(child: Center(child: Text('Limited Usage'))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBiometricDetails(
      BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(description),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
