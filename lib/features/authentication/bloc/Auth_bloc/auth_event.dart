// auth_event.dart

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {} // Define the AppStarted event

class AuthCheckRequested extends AuthEvent {} // Define the AuthCheckRequested event

class UserLoggedIn extends AuthEvent {} // Define the UserLoggedIn event

class UserLoggedOut extends AuthEvent {} // Define the UserLoggedOut event
