import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final ScrollController _scrollController = ScrollController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context: context),
    );
  }

  _buildBody({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            _buildLoginPage(context),
            _buildRegisterPage(context),
          ],
        ),
      ),
    );
  }

  _buildRegisterPage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
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
                onPressed: () => Navigator.of(context).popAndPushNamed('/main'),
                child: const Text('Create Account'),
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
                          image: AssetImage('assets/images/google.png')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Sign up with Google', style: Theme.of(context).textTheme.bodySmall,),
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
                  onPressed: (){
                    _scrollTo(context: context, page: 0);
                  },
                  child: const Text('Sign in now'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildLoginPage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
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
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: kMainAccentColor),
                ),
              ],
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
                      onPressed: () => Navigator.of(context).popAndPushNamed('/main'),
                      child: const Text('Sign in'),
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
                                image: AssetImage('assets/images/google.png')
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Sign in with Google', style: Theme.of(context).textTheme.bodySmall,),
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
                        onPressed: (){
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
    );
  }

  void _scrollTo({required BuildContext context, required int page}) async {
    await _scrollController.animateTo(MediaQuery.of(context).size.height * page, duration: const Duration(milliseconds: 1000), curve: Curves.fastEaseInToSlowEaseOut);
  }
}
