import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crevify/features/authentication/services/auth_service.dart'; 
import 'features/authentication/bloc/Auth_bloc/auth_bloc.dart';
import 'features/authentication/bloc/Auth_bloc/auth_state.dart';
import 'features/homepage/screens/home_page.dart'; 
import 'features/Onboarding/widgets/onboarding_widget.dart'; 
import 'features/Onboarding/widgets/splash_screen.dart'; 
import 'features/authentication/screens/login_page.dart'; // Import your LoginPage widget
import 'features/authentication/screens/signup_page.dart'; // Import your SignupPage widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(); 
  runApp(
    BlocProvider(
      create: (context) => AuthBloc(AuthenticationService(FirebaseAuth.instance)),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crevify',
      initialRoute: '/',
      routes: {
        '/': (context) => BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitial) {
                  return const SplashScreen();
                } else if (state is AuthAuthenticated) {
                  return HomePage(user: state.user); // Pass user to HomePage
                } else {
                  return const OnboardingWidget();
                }
              },
            ),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        // other routes...
      },
    );
  }
}
