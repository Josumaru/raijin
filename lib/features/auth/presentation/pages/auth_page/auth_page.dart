import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _usernameRegisterTextEditiongController =
      TextEditingController();
  final TextEditingController _emailRegisterTextEditiongController =
      TextEditingController();
  final TextEditingController _passwordRegisterTextEditiongController =
      TextEditingController();
  final TextEditingController _confirmRegisterPasswordTextEditiongController =
      TextEditingController();
  final TextEditingController _emailLoginTextEditiongController =
      TextEditingController();
  final TextEditingController _passwordLoginTextEditiongController =
      TextEditingController();
  final GlobalKey<FormState> _registerFormState = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginFormState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popAndPushNamed('/main');
      });
    }
    return Scaffold(
      body: _buildBody(context: context),
    );
  }

  _buildBody({required BuildContext context}) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _scrollController,
      child: Column(
        children: [
          _buildLoginPage(context),
          _buildRegisterPage(context),
        ],
      ),
    );
  }

  _buildRegisterPage(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Form(
                  key: _registerFormState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _usernameRegisterTextEditiongController,
                        validator: (value) =>
                            value!.isEmpty ? 'Username cannot empty' : null,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.user,
                          ),
                          label: Text("Username"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailRegisterTextEditiongController,
                        validator: (value) =>
                            value!.isEmpty ? 'Email cannot empty' : null,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.direct_normal,
                          ),
                          label: Text("E-Mail"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value !=
                              _passwordRegisterTextEditiongController.text) {
                            return 'Password not match';
                          } else if (value == '') {
                            return 'Password cannot empty';
                          } else if (value!.length < 8) {
                            return 'The password length should be at least 8';
                          }
                          return null;
                        },
                        controller: _passwordRegisterTextEditiongController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.lock,
                          ),
                          suffixIcon: Icon(
                            Iconsax.eye_slash,
                          ),
                          label: Text("Password"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller:
                            _confirmRegisterPasswordTextEditiongController,
                        validator: (value) {
                          if (value !=
                              _passwordRegisterTextEditiongController.text) {
                            return 'Password not match';
                          } else if (value == '') {
                            return 'Password cannot empty';
                          } else if (value!.length < 8 ||
                              value !=
                                  _passwordRegisterTextEditiongController
                                      .text) {
                            return 'The password length should be at least 8';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.check,
                          ),
                          suffixIcon: Icon(
                            Iconsax.eye_slash,
                          ),
                          label: Text("Confirm Password"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            _registerFormState.currentState!.validate();
                            final username = _usernameRegisterTextEditiongController.text;
                            final password = _passwordRegisterTextEditiongController.text;
                            final email = _emailRegisterTextEditiongController.text;
                            final confirm = _passwordRegisterTextEditiongController.text == _confirmRegisterPasswordTextEditiongController.text;
                            if ( password.isNotEmpty && username.isNotEmpty && email.isNotEmpty && confirm ) {
                              context.read<AuthBloc>().add(
                                    UserAuthEvent(
                                      username: username,
                                      email: email,
                                      password: password,
                                      auth: 'register'
                                    ),
                                  );
                            }
                          },
                          child: const Text('Create Account'),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'I Agree with ',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: 'Terms & Conditions ',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            TextSpan(
                                text: 'and ',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: 'Privacy Policy',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ])),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: Divider(
                              indent: 50,
                              endIndent: 5,
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                          ),
                          Text(
                            'Or Sign up with',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          const Flexible(
                            child: Divider(
                              indent: 5,
                              endIndent: 50,
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/google.png')),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Sign up with Google',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an Account?'),
                          TextButton(
                            onPressed: () {
                              _scrollTo(context: context, page: 0);
                            },
                            child: const Text('Sign in now'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            (state is AuthLoading)
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.2)),
                    child: Center(
                      child: CupertinoActivityIndicator(
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }

  _buildLoginPage(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if(state is AuthLoaded && FirebaseAuth.instance.currentUser != null) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.of(context).popAndPushNamed('/main');
          });
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Iconsax.flash_14,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        const Text(
                          'Welcome ',
                          style:
                              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'back,',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kMainAccentColor),
                        ),
                      ],
                    ),
                    Text(
                      'Watch, Download, and Discover Your Favourite Anime for Free Everywhere and Anywhere!',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Form(
                      key: _loginFormState,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _emailLoginTextEditiongController,
                            validator: (value) {
                              if(RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value!)) {
                                return null;
                              }
                              return 'Email not valid';
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.direct_normal,
                              ),
                              label: Text("E-Mail"),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordLoginTextEditiongController,
                            validator: (value){
                              if(value == '') {
                                return 'Password cannot empty';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.lock,
                              ),
                              suffixIcon: Icon(
                                Iconsax.eye_slash,
                              ),
                              label: Text("Password"),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                              ),
                              const Text('Keep me for a week'),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Forgot Password?'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_loginFormState.currentState!.validate()) {
                                  context.read<AuthBloc>().add(UserAuthEvent(email: _emailLoginTextEditiongController.text, password: _passwordLoginTextEditiongController.text, save: true, auth: 'login'));
                                  if (state is AuthFailed) {
                                    showDialog(context: context, builder: (context) =>
                                      AlertDialog(
                                        title: Text('Password or email is incorrect!'),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Try again')
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text('Login'),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Flexible(
                                child: Divider(
                                  indent: 50,
                                  endIndent: 5,
                                  color: Colors.grey,
                                  thickness: 0.5,
                                ),
                              ),
                              Text(
                                'Or Signin with',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey),
                              ),
                              const Flexible(
                                child: Divider(
                                  indent: 5,
                                  endIndent: 50,
                                  color: Colors.grey,
                                  thickness: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/google.png')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'Sign in with Google',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Didn\'t have an Account?'),
                              TextButton(
                                onPressed: () {
                                  _scrollTo(context: context, page: 1);
                                },
                                child: const Text('Sign up now'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            (state is AuthLoading) ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2)
              ),
              child: Center(
                child: CupertinoActivityIndicator(color: Theme.of(context).primaryColor),
              ),
            ) : Container(),
          ],
        );
      },
    );
  }

  void _scrollTo({required BuildContext context, required int page}) async {
    await _scrollController.animateTo(MediaQuery.of(context).size.height * page,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastEaseInToSlowEaseOut);
  }
}
