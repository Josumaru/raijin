import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:raijin/features/video/data/models/video_model.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context: context),
    );
  }
}


_buildBody({required BuildContext context}) {
  final firebase = FirebaseAuth.instance.currentUser;
  final username = firebase?.displayName;
  final email = firebase?.email;
  const password = 'authority';
  final user = sl<Box<AuthModel>>().get('users');

  print('=========open======${user}=================');
  if(firebase != null) {
    context.read<AuthBloc>().add(UserAuthEvent(username: username!, email: email!, password: password, auth: 'login', save: false));
  } else {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).popAndPushNamed('/welcome');
    });
  }
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      Future.delayed(const Duration(seconds: 2), (){
        if(state is AuthLoaded) {
          return Navigator.of(context).popAndPushNamed('/main');
        } else if (state is AuthFailed) {
          return Navigator.of(context).popAndPushNamed('/welcome');
        }
        // return Navigator.of(context).popAndPushNamed('/welcome');
      });
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
          ),
          Icon(
            Iconsax.flash_14,
            size: 80,
            weight: 0.002,
            color: Theme.of(context).primaryColor,
          ),
          const Text(
            'Raijin',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          const Spacer(),
          Column(
            children: [
              const Text(
                'from',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Josu',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'maru',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 32)
            ],
          ),
        ],
      );
    },
  );
}
// }
