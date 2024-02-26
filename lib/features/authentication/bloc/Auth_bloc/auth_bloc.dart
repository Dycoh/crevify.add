// auth_bloc.dart

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crevify/features/authentication/services/auth_service.dart'; // Import your AuthenticationService

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationService _authService;
  late StreamSubscription _authSubscription;

  AuthBloc(this._authService) : super(AuthInitial()) {
    _authSubscription = _authService.authStateChanges.listen((User? user) {
      if (user == null) {
        add(UserLoggedOut());
      } else {
        add(UserLoggedIn());
      }
    });

    on<UserLoggedIn>((event, emit) {
      emit(AuthAuthenticated());
    });

    on<UserLoggedOut>((event, emit) {
      emit(AuthUnauthenticated());
    });
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
