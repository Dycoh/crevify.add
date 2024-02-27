import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import SvgPicture from flutter_svg package
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../shared/theme/theme.dart'; // Import theme.dart file

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.darkGreenColor, // Set background color to dark green
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100.0, left: 20.0),
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0, // Increase font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0), // Add spacing
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Your journey awaits. Log in to access all the features.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(height: 40.0), // Add spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)), // Lighten font color
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16.0), // Smaller font size
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)), // Lighten font color
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16.0), // Smaller font size
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Perform login action
                      Navigator.pushNamed(context, '/login'); // Navigate to the login screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 14),
                      backgroundColor: Colors.green[900], // Set button background color
                    ),
                    child: const Text(
                      'Log In', // Change button text to Log In
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0), // Add spacing
                  const Text(
                    'or log in with...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold, // Make text bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0), // Add spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Align row to the center
                    children: [
                      _buildSocialButton(MdiIcons.phone, Colors.white),
                      const SizedBox(width: 20.0), // Add spacing
                      _buildSocialButton(MdiIcons.google, Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0), // Add spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to sign up page
                  Navigator.pushNamed(context, '/signup_page.dart');
                },
                child: Text(
                  'New to Crevify? Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0), // Add spacing
            const Align(
              alignment: Alignment.bottomLeft, // Align to the bottom left
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Powered By',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10.0), // Add spacing
            Align(
              alignment: Alignment.bottomLeft, // Align to the bottom left
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  'assets/logos/Ace_Cyber_Space_Logo_Horizontal_Full_Lockup_White.svg',
                  height: 40.0,
                  width: 120.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 60.0, // Increase icon button size
      height: 60.0, // Increase icon button size
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.primaryColor, // Use primary color from theme
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Icon(icon, color: color, size: 32.0), // Increase icon size
    );
  }
}
