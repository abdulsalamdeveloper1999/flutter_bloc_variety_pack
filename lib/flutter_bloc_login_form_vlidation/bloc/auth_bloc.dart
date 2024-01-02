import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_authHandler);
    on<AuthLogoutRequested>(_authLogoutHander);
  }

  void _authHandler(AuthLoginRequested event, Emitter<AuthState> emit) async {
    final email = event.email;
    final password = event.password;
    emit(AuthLoading());
    try {
      if (password.length < 6) {
        return emit(
          AuthFaliure(error: 'Password cannot be less than 6 characters'),
        );
      }

      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: '$email-$password'));
      });
    } catch (e) {
      return emit(AuthFaliure(error: e.toString()));
    }
  }

  void _authLogoutHander(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
