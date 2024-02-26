import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Dispatch signup event to the bloc
            // You should have access to the bloc through BlocProvider or context.read
            // For example:
            // context.read<YourAuthBloc>().add(YourSignupEvent());
          },
          child: Text('Sign Up'),
        ),
      ),
    );
  }
}
