import 'package:flutter/material.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            sl<AuthBloc>().add(const AuthEvent.authLogout());
          },
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
