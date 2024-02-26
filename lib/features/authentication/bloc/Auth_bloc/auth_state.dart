// auth_state.dart

import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {} // Define the AuthInitial state

class AuthAuthenticated extends AuthState {} // Define the AuthAuthenticated state

class AuthUnauthenticated extends AuthState {} // Define the AuthUnauthenticated state
