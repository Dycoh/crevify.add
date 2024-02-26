import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Call method to login with email and password
                _loginWithEmailPassword(context);
              },
              child: Text('Login with Email/Password'),
            ),
            ElevatedButton(
              onPressed: () {
                // Call method to login with Google
                _loginWithGoogle(context);
              },
              child: Text('Login with Google'),
            ),
            ElevatedButton(
              onPressed: () {
                // Call method to login with phone
                _loginWithPhone(context);
              },
              child: Text('Login with Phone'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle login with email and password
  void _loginWithEmailPassword(BuildContext context) {
    // Implement your logic for login with email and password here
  }

  // Method to handle login with Google
  void _loginWithGoogle(BuildContext context) {
    // Implement your logic for login with Google here
  }

  // Method to handle login with phone
  void _loginWithPhone(BuildContext context) {
    // Implement your logic for login with phone here
  }
}
