// Importing Flutter's Material Design library which provides a visual, interaction design, and motion API.
import 'package:flutter/material.dart';

// Importing Firebase's authentication library to use Firebase's authentication services.
import 'package:firebase_auth/firebase_auth.dart';

// Importing the theme for the application.
import '../../../shared/theme/theme.dart';

// Importing the OnboardingWidget from the onboarding widgets directory.
import '../features/onboarding/widgets/onboarding_widget.dart';

// Importing the SplashScreen from the onboarding widgets directory.
import '../features/onboarding/widgets/splash_screen.dart';

// The main function of the app. This is the entry point for the Flutter application.
void main() {
  runApp(MyApp());
}

// MyApp class. This class represents the whole application.
class MyApp extends StatelessWidget {
  // Constructor for MyApp class.
  const MyApp({super.key});

  // Function to check if the user is logged in.
  // This function is asynchronous because it has to wait for the Firebase's currentUser function.
  Future<bool> checkIfUserIsLoggedIn() async {
    // Creating an instance of FirebaseAuth.
    final FirebaseAuth _auth = FirebaseAuth.instance;

    // Getting the current user.
    final User? user = _auth.currentUser;

    // If the user is not null, that means a user is logged in, so we return true.
    // Otherwise, we return false.
    return user != null;
  }

  // The build function that Flutter calls to build the widget tree.
  @override
  Widget build(BuildContext context) {
    // Returning a MaterialApp widget. This is a convenience widget that wraps a number of widgets that are commonly required for applications implementing Material Design.
    return MaterialApp(
      // The title of the application.
      title: 'Crevify',

      // The light theme of the application.
      theme: AppTheme.lightTheme,

      // The dark theme of the application.
      darkTheme: AppTheme.darkTheme,

      // The home of the application.
      home: FutureBuilder<bool>(
        // The future that this FutureBuilder is listening to.
        future: checkIfUserIsLoggedIn(),

        // The builder for this FutureBuilder.
        // This builder will be called every time the connection state changes.
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          // If the connection state is waiting, that means the future is still running.
          // So, we return a SplashScreen.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            // If the connection state is not waiting, that means the future has completed.
            // So, we check the data of the snapshot.
            // If the data is true, that means the user is logged in. So, we return a Text widget with 'Home Page'.
            // If the data is false or null, that means the user is not logged in. So, we return an OnboardingWidget.
            if (snapshot.hasData && snapshot.data!) {
              return Text('Home Page');
            } else {
              return OnboardingWidget();
            }
          }
        },
      ),
    );
  }
}
