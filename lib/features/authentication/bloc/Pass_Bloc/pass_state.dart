part of 'pass_bloc.dart';

abstract class PassState extends Equatable {
  const PassState();

  @override
  List<Object> get props => [];
}

class PasswordFieldState extends PassState {}

class ConfirmPasswordFieldState extends PassState {}
