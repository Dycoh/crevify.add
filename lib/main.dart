import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crevify/features/authentication/services/auth_service.dart'; // Import your AuthenticationService

import 'features/authentication/bloc/Auth_bloc/auth_bloc.dart';
import 'features/authentication/bloc/Auth_bloc/auth_event.dart';
import 'features/authentication/bloc/Auth_bloc/auth_state.dart';
import 'features/homepage/screens/home_page.dart'; // Import your home page widget
import 'features/Onboarding/widgets/onboarding_widget.dart'; // Import your onboarding widget
import 'features/Onboarding/widgets/splash_screen.dart'; // Import your splash screen widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(
    BlocProvider(
      create: (context) => AuthBloc(AuthenticationService(FirebaseAuth.instance)),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crevify',
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            return SplashScreen(); // Display SplashScreen while checking authentication state
          } else if (state is AuthAuthenticated) {
            return HomePage(); // Display HomePage if user is authenticated
          } else {
            return OnboardingWidget(); // Display OnboardingWidget if user is not authenticated
          }
        },
      ),
    );
  }
}
