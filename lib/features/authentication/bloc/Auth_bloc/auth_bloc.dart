import 'dart:async';
import 'package:bloc/bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crevify/features/authentication/services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationService _authService;
  late StreamSubscription<User?> _authSubscription;

  AuthBloc(this._authService) : super(AuthInitial()) {
    _authSubscription = _authService.authStateChanges.listen((User? user) {
      if (user == null) {
        add(UserLoggedOut());
      } else {
        add(UserLoggedIn(user)); // Pass user to UserLoggedIn event
      }
    });

    on<UserLoggedIn>((event, emit) {
      emit(AuthAuthenticated(event.user)); // Pass user to AuthAuthenticated state
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
