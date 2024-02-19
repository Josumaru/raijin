import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  // TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context: context),
    );
  }

  _buildBody({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Iconsax.flash_14,
                  size: 128,
                ),
                const Text(
                  'Welcome back,',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Watch, Download, and Discover Your Favourite Anime for Free Everywhere and Anywhere!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Iconsax.direct_normal,
                          ),
                          label: const Text("E-Mail"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Iconsax.lock,
                          ),
                          suffixIcon: const Icon(
                            Iconsax.eye_slash,
                          ),
                          label: const Text("Password"),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text('Remember Me'),
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
                          onPressed: () {},
                          child: const Text('Sign in'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Register'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Divider(
                              indent: 50,
                              endIndent: 5,
                              color: kMainAccentColor,
                              thickness: 0.5,
                            ),
                          ),
                          Text('Or Signin with'),
                          Flexible(
                            child: Divider(
                              indent: 5,
                              endIndent: 50,
                              color: kMainAccentColor,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  
}
