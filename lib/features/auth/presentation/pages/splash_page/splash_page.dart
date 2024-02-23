import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context: context),
    );
  }
}

// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:raijin/core/constants/constants.dart';
// import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   final bool isLogin = false;
//   @override
//   void initState() {
//     super.initState();
//     _setPage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(context: context),
//     );
//   }

//   _setPage() async {
//     final firebase = await FirebaseAuth.instance.currentUser;
//     final username = firebase?.displayName;
//     final email = firebase?.email;
//     final password = 'raijinauthor';
//     print(username);
//     print(email);
//     Future.delayed(const Duration(seconds: 1),(){
//       if (firebase != null) {
//         BlocProvider.of<AuthBloc>(context).add(UserAuthEvent(username: username!, email: email!, password: password, auth: 'login'));
//         if
//       }
//     });
//   }

_buildBody({required BuildContext context}) {
  final firebase = FirebaseAuth.instance.currentUser;
  final username = firebase?.displayName;
  final email = firebase?.email;
  final password = 'raijinauthor';
  if(firebase != null) {
    context.read<AuthBloc>().add(UserAuthEvent(username: username!, email: email!, password: password, auth: 'login'));
  }
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      Future.delayed(const Duration(seconds: 2), (){
        if(state is AuthLoaded) {
          return Navigator.of(context).popAndPushNamed('/main');
        } else if (state is AuthFailed) {
          return Navigator.of(context).popAndPushNamed('/welcome');
        }
        return Navigator.of(context).popAndPushNamed('/welcome');
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
              Text(
                'from',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
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
              SizedBox(height: 32)
            ],
          ),
        ],
      );
    },
  );
}
// }
