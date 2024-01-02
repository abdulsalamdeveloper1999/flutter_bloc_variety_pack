part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String uid;

  AuthSuccess({required this.uid});
}

final class AuthFaliure extends AuthState {
  final String error;

  AuthFaliure({required this.error});
}

final class AuthLoading extends AuthState {}
