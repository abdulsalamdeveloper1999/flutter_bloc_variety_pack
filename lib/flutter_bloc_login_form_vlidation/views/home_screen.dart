import 'package:bloc_and_bloc_cubit/flutter_bloc_login_form_vlidation/bloc/auth_bloc.dart';
import 'package:bloc_and_bloc_cubit/flutter_bloc_login_form_vlidation/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Center(
              child: Text(state.uid),
            );
          }
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Text('no state');
        },
        listener: (BuildContext context, AuthState state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
            );
          }
        },
      ),
    );
  }
}
