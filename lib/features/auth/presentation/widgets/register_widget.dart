import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/commons/widgets/loading_widget.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    super.key,
    required this.setPage,
    required this.formState,
  });

  final VoidCallback setPage;
  final GlobalKey<FormState> formState;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;
  late bool _isChecked;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
    _isChecked = false;
    _obscureText = true;
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: widget.formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nameController,
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
                    controller: _emailController,
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
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Password not match';
                      } else if (value == '') {
                        return 'Password cannot empty';
                      } else if (value!.length < 8) {
                        return 'The password length should be at least 8';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Iconsax.lock,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        splashColor: Colors.transparent,
                        borderRadius: kMainBorderRadius,
                        child: Icon(
                          _obscureText ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                      ),
                      label: const Text("Password"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: _obscureText,
                    controller: _confirmController,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Password not match';
                      } else if (value == '') {
                        return 'Password cannot empty';
                      } else if (value!.length < 8 ||
                          value != _passwordController.text) {
                        return 'The password length should be at least 8';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Iconsax.check,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        splashColor: Colors.transparent,
                        borderRadius: kMainBorderRadius,
                        child: Icon(
                          _obscureText ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                      ),
                      label: const Text("Confirm Password"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (widget.formState.currentState!.validate()) {
                          final name = _nameController.text;
                          final password = _passwordController.text;
                          final email = _emailController.text;
                          _isChecked
                              ? _register(
                                  context: context,
                                  name: name,
                                  email: email,
                                  password: password,
                                )
                              : _alert(
                                  message: 'Please check the agreement!',
                                );
                        }
                      },
                      child: const Text('Create Account'),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = !_isChecked;
                            });
                          },
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'I Agree with ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: 'Terms & Conditions ',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              TextSpan(
                                text: 'and ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
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
                      Text('Or Use Existing Account',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey)),
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
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: OutlinedButton(
                  //     onPressed: () {},
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           height: 25,
                  //           width: 25,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(50),
                  //             image: const DecorationImage(
                  //               image: AssetImage('assets/images/google.png'),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 10),
                  //           child: Text(
                  //             'Sign up with Google',
                  //             style: Theme.of(context).textTheme.bodySmall,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an Account?'),
                      TextButton(
                        onPressed: () {
                          widget.setPage();
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
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return Container();
              },
              loading: () {
                return Positioned.fill(
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: onBackgroundColor(context: context)
                            .withOpacity(0.2),
                      ),
                      child: const LoadingWidget(),
                    ),
                  ),
                );
              },
              loaded: (authModel) {
                return Text(authModel!.name);
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
}

void _register({
  required BuildContext context,
  required String name,
  required String email,
  required String password,
}) {
  AuthModel authModel = AuthModel(
    name: name,
    email: email,
    password: password,
    image: '',
    id: '',
  );
  context.read<AuthBloc>().add(AuthEvent.authregister(authModel: authModel));
}

void _alert({required String message}) {
  sl<ToastUseCase>()(params: message);
}
