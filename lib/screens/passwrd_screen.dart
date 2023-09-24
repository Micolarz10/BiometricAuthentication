import 'package:flutter/material.dart';


// --------------------------------password
class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isPasswordVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<Map<String, String>> _passwordList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                _passwordList.add({'username': username, 'password': password});
                // Perform other actions like saving to storage

                // Update the display
                setState(() {});

                // Print the updated password list
                print('Updated Password List: $_passwordList');
              },
              child: const Text('Save Password'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _passwordList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text('Username: ${_passwordList[index]['username']}'),
                    subtitle:
                        Text('Password: ${_passwordList[index]['password']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
