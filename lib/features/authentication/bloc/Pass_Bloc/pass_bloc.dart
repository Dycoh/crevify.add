import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pass_event.dart';
part 'pass_state.dart';

class PassBloc extends Bloc<PassEvent, PassState> {
  PassBloc() : super(PasswordFieldState());

  @override
  Stream<PassState> mapEventToState(
    PassEvent event,
  ) async* {
    if (event is PasswordSubmitted) {
      yield ConfirmPasswordFieldState();
    }
  }
}
