import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/theme/theme.dart';
import 'onboarding_widget.dart'; // Import the OnboardingWidget

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to OnboardingWidget after 3 seconds
    Future.delayed(const Duration(seconds: 5 ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingWidget()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF2A4400),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: SvgPicture.asset('assets/logos/CampusCrave_Iconmark_Main.svg'),
              ),
            ),
            Text(
              'Brought to you by ',
              style: TextStyle(color: AppTheme.lightTheme.colorScheme.onBackground),
            ),
            Text(
              'Campus Crave Co.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.lightTheme.colorScheme.onBackground,
              ),
            ),
            Text(
              'Powered by',
              style: TextStyle(color: AppTheme.lightTheme.colorScheme.onBackground),
            ),
            SvgPicture.asset('assets/logos/Ace_Cyber_Space_Logo_Horizontal_Full_Lockup_White.svg'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
