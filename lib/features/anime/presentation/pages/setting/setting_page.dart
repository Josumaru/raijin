import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              children: [
                _buildProfile(context: context, state: state),
                _buildHistory(context: context),
                _buildOptions(context: context),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context).popAndPushNamed('/auth'));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.logout),
                          Text('Sign Out'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding _buildOptions({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            OptionCardWidget(icon: Icon(Iconsax.settings), option: 'General'),
            OptionCardWidget(icon: Icon(Iconsax.notification), option: 'Notifications'),
            OptionCardWidget(icon: Icon(Iconsax.video), option: 'Video Settings'),
            OptionCardWidget(icon: Icon(Iconsax.brush_3), option: 'Theme'),
            OptionCardWidget(icon: Icon(Iconsax.personalcard), option: 'Account'),
            OptionCardWidget(icon: Icon(Iconsax.shapes), option: 'About Raijin Apps'),
          ],
        ),
      ),
    );
  }

  Padding _buildHistory({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            const OptionCardWidget(icon: Icon(Iconsax.clock), option: 'History'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width / 7,
                            width: MediaQuery.of(context).size.width / 4,
                            margin: EdgeInsets.fromLTRB(
                              (index == 0) ? 8 : 0,
                              0,
                              2,
                              0,
                            ),
                            decoration: BoxDecoration(
                              color: kMainAccentColor,
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                (index == 0) ? 10 : 2,
                                2,
                                2,
                                0,
                              ),
                              child: Text(
                                'EP 8',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            )
                          ),
                          Container(
                            height: 3,
                            width: (MediaQuery.of(context).size.width / 4),
                            margin: EdgeInsets.fromLTRB(
                              (index == 0) ? 8 : 0,
                              0,
                              2,
                              0,
                            ),
                            decoration: BoxDecoration(
                              color: kMainLightBackgroundColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          Container(
                            height: 3,
                            width: (MediaQuery.of(context).size.width / 4) * 0.5,
                            margin: EdgeInsets.fromLTRB(
                              (index == 0) ? 8 : 0,
                              0,
                              2,
                              0,
                            ),
                            decoration: BoxDecoration(
                              color: kMainAccentColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                          (index == 0) ? 8 : 0,
                            0,
                            2,
                            0,
                          ),
                          child: Text(
                            'Index Index Index-$index',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ),
            ),
            const OptionCardWidget(icon: Icon(Iconsax.like), option: 'Liked Video'),
            const OptionCardWidget(icon: Icon(Iconsax.archive_2), option: 'Recomendation'),
          ],
        ),
      ),
    );
  }

  _buildProfile({required BuildContext context, required AuthState state}) {
    if (state is AuthLoaded) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage:
                    AssetImage('assets/images/profile.jpg'),
              ),
              Text(
                // state.authEntity!.username.toString(),
                context.read<AuthBloc>().state.authEntity!.username,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
              ),
              Text(
                state.authEntity!.email.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('0', style: Theme.of(context).textTheme.bodyLarge,),
                      Text('Watched', style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                  Column(
                    children: [
                      Text('0', style: Theme.of(context).textTheme.bodyLarge,),
                      Text('Raiexp', style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                  Column(
                    children: [
                      Text('0', style: Theme.of(context).textTheme.bodyLarge,),
                      Text('Follower', style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

class OptionCardWidget extends StatelessWidget {
  const OptionCardWidget({
    super.key,
    required this.icon,
    required this.option,
  });
  final Icon icon;
  final String option;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          icon,
          Text(option),
          Spacer(),
          Icon(Iconsax.arrow_right_3),
        ],
      ),
    );
  }
}
