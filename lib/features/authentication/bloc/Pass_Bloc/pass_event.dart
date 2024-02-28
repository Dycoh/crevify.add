part of 'pass_bloc.dart';

abstract class PassEvent extends Equatable {
  const PassEvent();

  @override
  List<Object> get props => [];
}

class PasswordSubmitted extends PassEvent {}
