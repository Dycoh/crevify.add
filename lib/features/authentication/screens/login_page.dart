import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../shared/theme/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.darkGreenColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Ensure bounded height
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 64.0),
              Image.asset(
                'assets/logos/_Iconmark_Main.webp',
                height: 100.0,
                width: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Your journey awaits. Log in to access all the features.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildInputField(MdiIcons.accountOutline, 'Username/Email'),
                    SizedBox(height: 20.0),
                    _buildPasswordField(),
                    SizedBox(height: 40.0), // Reduced space between login and google button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                        backgroundColor: CustomTheme.lightTheme.primaryColor, // Use CustomTheme
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0), // Reduced space between login and google button
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.0), // Reduced space between 'or' text and Google button
                    OutlinedButton(
                      onPressed: () {
                        // Perform login with Google action
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                        side: BorderSide(color: CustomTheme.lightTheme.primaryColor), // Use CustomTheme
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            MdiIcons.google,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Log In with Google',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup_page.dart');
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'New to Crevify? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Create Account',
                          style: TextStyle(
                            color: CustomTheme.lightTheme.primaryColor, // Use CustomTheme
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Powered By',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10, // Make text slightly smaller
                        ),
                      ),
                      SizedBox(height: 5.0), // Reduce space between 'Powered By' text and logo
                      SvgPicture.asset(
                        'assets/logos/Ace_Cyber_Space_Logo_Horizontal_Full_Lockup_White.svg',
                        height: 40.0,
                        width: 120.0,
                        color: Colors.white, // Change color to white
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(IconData icon, String hintText) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
            MdiIcons.lockOutline,
            color: Colors.white,
            size: 20.0,
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implement your forgot password logic here
                },
                child: Text(
                  'Forgot?',
                  style: TextStyle(
                    color: CustomTheme.lightTheme.primaryColor, // Use CustomTheme
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
