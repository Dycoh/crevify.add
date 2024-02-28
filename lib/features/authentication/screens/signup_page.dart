import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../shared/theme/theme.dart';
import '../bloc/Pass_Bloc/pass_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.darkGreenColor,
      body: BlocProvider(
        create: (context) => PassBloc(),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
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
                      'Join Us!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5.0),  // Reduce space
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Create an account to start your journey with us.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 4.0),  // Reduce space
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(child: _buildInputField('First Name')),
                            SizedBox(width: 10.0),
                            Expanded(child: _buildInputField('Last Name')),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        _buildInputField('Email'),
                        SizedBox(height: 10.0),
                        BlocBuilder<PassBloc, PassState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(child: _buildPasswordField()),
                                SizedBox(width: 10.0),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    BlocProvider.of<PassBloc>(context).add(PasswordSubmitted());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero, backgroundColor: CustomTheme.lightTheme.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                                  label: SizedBox.shrink(),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 28.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                            backgroundColor: CustomTheme.lightTheme.primaryColor,
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          'or',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.0),
                        OutlinedButton(
                          onPressed: () {
                            // Perform signup with Google action
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                            side: BorderSide(color: CustomTheme.lightTheme.primaryColor),
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
                                'Sign Up with Google',
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
                        Navigator.pushNamed(context, '/login');
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Log In',
                              style: TextStyle(
                                color: CustomTheme.lightTheme.primaryColor,
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
                              color: const Color.fromARGB(136, 255, 255, 255),
                              fontSize: 9, // Make text slightly smaller
                            ),
                          ),
                          SizedBox(height: 5.0), // Reduce space between 'Powered By' text and logo
                          SvgPicture.asset(
                            'assets/logos/Ace_Cyber_Space_Logo_Horizontal_Full_Lockup_White.svg',
                            height: 35.0,
                            width: 105.0,
                            color: const Color.fromARGB(155, 255, 255, 255), // Change color to white
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
        ),
      ),
    );
  }

  Widget _buildInputField(String label) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white, fontSize: 16.0), // Reduced font size
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: CustomTheme.lightTheme.primaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        isDense: true,  // Add this line to reduce the height of input fields
      ),
    );
  }

  Widget _buildPasswordField() {
    return Expanded(
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.white, fontSize: 16.0), // Reduced font size
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomTheme.lightTheme.primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          isDense: true,  // Add this line to reduce the height of input fields
        ),
      ),
    );
  }
}
