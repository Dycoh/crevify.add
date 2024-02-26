import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red, // Set background color to red
      body: Center(
        child: CircularProgressIndicator(
          color:
              Colors.white, // Set color of CircularProgressIndicator to white
        ),
      ),
    );
  }
}
