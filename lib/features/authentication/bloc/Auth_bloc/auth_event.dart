import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class UserLoggedIn extends AuthEvent {
  final User user; // Define user parameter

  const UserLoggedIn(this.user);

  @override
  List<Object?> get props => [user];
}

class UserLoggedOut extends AuthEvent {}
