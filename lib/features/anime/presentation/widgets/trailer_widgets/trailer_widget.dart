import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TrailerWidget extends StatelessWidget {
  const TrailerWidget({super.key, required String url}) : _url = url;
  final String _url;
  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(_url);
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    if (videoId == null) {
      return Container();
    }
    return Column(
      children: [
        const SizedBox(height: 10),
        YoutubePlayer(
          controller: controller,
          bottomActions: const [],
          topActions: const [],
          showVideoProgressIndicator: true,
          progressIndicatorColor: primaryColor(context: context),
          bufferIndicator: const Text('Buffer'),
          progressColors: ProgressBarColors(
            bufferedColor: primaryColor(context: context).withOpacity(0.2),
            handleColor: primaryColor(context: context),
            playedColor: primaryColor(context: context),
          ),
        ),
        Padding(
          padding: kTopPadding,
          child: ElevatedButton(
            onPressed: () {
              _launchUrl(_url);
            },
            child: Row(
              mainAxisAlignment: kMainAxisAligmentCenter(),
              children: [
                const Icon(Iconsax.play),
                Text(
                  'Watch Trailer on YouTube',
                  style: bodyLarge(context: context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _launchUrl(String target) async {
  final uri = Uri.parse(target);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $uri');
  }
}
