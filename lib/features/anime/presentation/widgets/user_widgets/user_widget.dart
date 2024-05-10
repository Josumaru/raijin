import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/commons/widgets/anime_video_description_button.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/anime/presentation/widgets/user_widgets/setting_item_widget.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = sl<FirebaseAuth>().currentUser!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text('Profile', style: bodyLarge(context: context)),
          // centerTitle: true,
          actions: [
            Padding(
              padding: kHorizontalPadding,
              child: const Icon(
                Iconsax.setting,
              ),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: kCrossAxisAlignmentStart(),
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://about.vidio.com/wp-content/uploads/2022/04/KAGUYA-SHINOMIYA.jpg',
                  imageBuilder: (context, imageProvider) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: imageProvider,
                        ),
                        Padding(
                          padding: kAllPadding,
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: kMainAxisAligmentStart(),
                                crossAxisAlignment: kCrossAxisAlignmentStart(),
                                children: [
                                  Text(
                                    user.displayName!,
                                    style: bodyLarge(context: context),
                                  ),
                                  Text(
                                    user.email!,
                                    style: bodySmall(context: context),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              OutlinedButton(
                                onPressed: () {},
                                child: const Text('Edit Profile'),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            AnimeVideoDescriptionButton(
                              icon: Iconsax.direct_normal,
                              text: 'My Download',
                              callback: () {},
                            ),
                            AnimeVideoDescriptionButton(
                              icon: Iconsax.save_2,
                              text: 'My List',
                              callback: () {},
                            ),
                            AnimeVideoDescriptionButton(
                              icon: Iconsax.danger,
                              text: 'Error Reporting',
                              callback: () {},
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: kLeftPadding,
                  child: Text(
                    'Preferences',
                    style: bodyLarge(context: context).copyWith(
                      color:
                          onBackgroundColor(context: context).withOpacity(0.5),
                    ),
                  ),
                ),
                const SettingItemWidget(
                  select: 'Theme',
                  option: 'Dark',
                  icon: Iconsax.brush_1,
                ),
                const SettingItemWidget(
                  select: 'Video Resolution',
                  option: '720p',
                  icon: Iconsax.play,
                ),
                const SettingItemWidget(
                  select: 'Playback Speed',
                  option: '1.0X',
                  icon: Iconsax.timer_start,
                ),
                const SettingItemWidget(
                  select: 'Clear Cache',
                  option: '44MB',
                  icon: Iconsax.trash,
                ),
                Padding(
                  padding: kLeftPadding,
                  child: Text(
                    'Apps',
                    style: bodyLarge(context: context).copyWith(
                      color:
                          onBackgroundColor(context: context).withOpacity(0.5),
                    ),
                  ),
                ),
                const SettingItemWidget(
                  select: 'Raijin',
                  option: 'Github',
                  icon: Iconsax.flash_14,
                ),
                const SettingItemWidget(
                  select: 'Samehadaku',
                  option: 'samehadaku.care',
                  icon: Iconsax.global,
                ),
                const SettingItemWidget(
                  select: 'Kraken',
                  option: 'krakenfiles.com',
                  icon: Iconsax.broom,
                ),
                Padding(
                  padding: kLeftPadding,
                  child: Text(
                    'Account',
                    style: bodyLarge(context: context).copyWith(
                      color:
                          onBackgroundColor(context: context).withOpacity(0.5),
                    ),
                  ),
                ),
                SettingItemWidget(
                  select: 'Log Out',
                  option: user.email!,
                  icon: Iconsax.export,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
