import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/commons/widgets/auth_loading_widget.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/navigators.dart';
import 'package:raijin/core/routes/route_name.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
    required this.setPage,
    required this.formState,
  });
  final VoidCallback setPage;
  final GlobalKey<FormState> formState;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        color: kMainAccentColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Watch, Download, and Discover Your Favourite Anime for Free Everywhere and Anywhere!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Form(
                  key: widget.formState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value!)) {
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
                        controller: _passwordController,
                        validator: (value) {
                          if (value == '') {
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
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            },
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
                            if (widget.formState.currentState!.validate()) {
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              _login(
                                email: email,
                                password: password,
                              );
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
                                      'assets/images/google.png',
                                    ),
                                  ),
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
                              widget.setPage();
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
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return Container();
              },
              loading: () => const AuthLoadingWidget(),
              loaded: (authModel) {
                pushReplacementNamed(
                  context: context,
                  routeName: RouteName.homePage,
                );
                return Container();
              },
              error: (message) {
                return Container();
              },
            );
          },
        ),
      ],
    );
  }

  void _login({required String email, required String password}) {
    AuthModel authModel = AuthModel(
      name: '',
      email: email,
      password: password,
      image: '',
      id: '',
    );
    context.read<AuthBloc>().add(AuthEvent.authLogin(authModel: authModel));
  }
}
