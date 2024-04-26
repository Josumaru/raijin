import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:raijin/core/commons/widgets/anime_episode_card.dart';
import 'package:raijin/core/commons/widgets/anime_episode_card_shimmer.dart';
import 'package:raijin/core/commons/widgets/loading_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/video_widgets/video_player_widget.dart';
import 'package:shimmer/shimmer.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
          bloc: BlocProvider.of<AnimeVideoBloc>(context),
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  state.isLoading ? _buildLoading() : _buildLoaded(state),
                ],
              ),
            );
            // return state.when(
            //     initial: () => Container(),
            //     loading: () => const LoadingWidget(),
            //     loaded: (videoModel) {
            //       return Column(
            //         mainAxisAlignment: kMainAxisAligmentStart(),
            //         crossAxisAlignment: kCrossAxisAlignmentStart(),
            //         children: [
            //           VideoPlayerWidget(videoModel: videoModel),
            //           MediaQuery.of(context).orientation == Orientation.portrait
            //               ? Padding(
            //                   padding: kMainPadding,
            //                   child: Text(
            //                     'Another Episodes',
            //                     style: bodyLarge(context: context),
            //                   ),
            //                 )
            //               : Container(),
            //           Expanded(
            //             child: SingleChildScrollView(
            //               scrollDirection: Axis.vertical,
            //               child: Column(
            //                 children: List.generate(
            //                   videoModel[0].anotherEpisode.length,
            //                   (index) => Padding(
            //                     padding: kMainPadding,
            //                     child: AnimeEpisodeCard(
            //                       episodeModel:
            //                           videoModel[0].anotherEpisode[index],
            //                       poster: videoModel[0]
            //                           .anotherEpisode[index]
            //                           .poster!,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           )
            //         ],
            //       );
            //     },
            //     error: (message) {
            //       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            //         Navigator.of(context).pop();
            //       });
            //       return Container();
            //     });
          },
        ),
      ),
    );
  }

  _buildLoaded(AnimeVideoState state) {
    List<EpisodeModel> anotherEpisode = state.videoList.first.anotherEpisode;
    return Column(
      crossAxisAlignment: kCrossAxisAlignmentStart(),
      children: [
        Padding(
          padding: kLeftPadding,
          child: Text(
            state.videoList.first.title,
            style: bodyLarge(context: context),
          ),
        ),
        Padding(
          padding: kAllPadding,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: state.videoList.first.poster,
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                    backgroundImage: imageProvider,
                  );
                },
              ),
              Padding(
                padding: kLeftPadding,
                child: Text(
                  state.videoList.first.mirror,
                  style: bodyMedium(context: context),
                ),
              ),
              Padding(
                padding: kLeftPadding,
                child: Text(
                  state.videoList.last.quality,
                  style: bodySmall(context: context),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                ),
                onPressed: () {},
                child: Padding(
                  padding: kHorizontalPadding,
                  child: const Row(
                    children: [
                      Icon(Iconsax.notification),
                      Text('Notify Me'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: kAllPadding,
          child: Text(
            'Watch Another Episode',
            style: bodyLarge(context: context),
          ),
        ),
        Column(
          children: List.generate(
            anotherEpisode.length,
            (index) {
              return CachedNetworkImage(
                imageUrl: anotherEpisode[index].poster!,
                imageBuilder: (context, imageProvider) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Image(image: imageProvider),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientListColor(context: context),
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: kAllPadding,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: imageProvider,
                            ),
                            Padding(
                              padding: kLeftPadding,
                              child: Column(
                                crossAxisAlignment: kCrossAxisAlignmentStart(),
                                children: [
                                  Text(
                                    anotherEpisode[index].title.replaceAll(
                                        'Episode ${anotherEpisode[index].episode}',
                                        ''),
                                    style: bodyMedium(context: context),
                                  ),
                                  Text(
                                    '${anotherEpisode[index].date} | Episode ${anotherEpisode[index].episode}',
                                    style: bodySmall(context: context),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
              // return Padding(
              //   padding: kHorizontalTopPadding,
              //   child: InkWell(
              //     onTap: () {},
              //     borderRadius: kMainBorderRadius,
              //     child: CachedNetworkImage(
              //       imageUrl: anotherEpisode[index].poster!,
              //       imageBuilder: (context, imageProvider) {
              //         return Row(
              //           children: [
              //             Stack(
              //               children: [
              //                 Container(
              //                   width: widthMediaQuery(context: context) * 0.3,
              //                   height:
              //                       heightMediaQuery(context: context) * 0.1,
              //                   decoration: BoxDecoration(
              //                     borderRadius: kMainBorderRadius,
              //                     image: DecorationImage(
              //                       image: imageProvider,
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                 ),
              //                 Positioned.fill(
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                       borderRadius: kMainBorderRadius,
              //                       gradient: LinearGradient(
              //                         colors:
              //                             gradientListColor(context: context),
              //                         begin: Alignment.topCenter,
              //                         end: Alignment.bottomCenter,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 Positioned(
              //                   bottom: 5,
              //                   left: 5,
              //                   child: Text(
              //                     '${anotherEpisode[index].episode}',
              //                     style:
              //                         headlineLarge(context: context).copyWith(
              //                       fontSize: 45,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Expanded(
              //               child: Padding(
              //                 padding: kLeftPadding,
              //                 child: SizedBox(
              //                   height:
              //                       heightMediaQuery(context: context) * 0.1,
              //                   child: Column(
              //                     crossAxisAlignment:
              //                         kCrossAxisAlignmentStart(),
              //                     mainAxisAlignment: kMainAxisAligmentStart(),
              //                     children: [
              //                       Text(
              //                         anotherEpisode[index].title,
              //                         style: headlineMedium(context: context),
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,
              //                       ),
              //                       Text(
              //                         anotherEpisode[index].date,
              //                         style: bodySmall(context: context),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             )
              //           ],
              //         );
              //       },
              //     ),
              //   ),
              // );
            },
          ),
        ),
      ],
    );
  }

  _buildLoading() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Positioned.fill(
            child: Shimmer.fromColors(
              baseColor: onBackgroundColor(context: context).withOpacity(0.05),
              highlightColor:
                  onBackgroundColor(context: context).withOpacity(0.1),
              child: Container(
                decoration: BoxDecoration(
                  color: onBackgroundColor(context: context),
                ),
              ),
            ),
          ),
          const LoadingWidget(),
        ],
      ),
    );
  }
}

// class LoadingWidget extends StatelessWidget {
//   const LoadingWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: kMainAxisAligmentStart(),
//       crossAxisAlignment: kCrossAxisAlignmentStart(),
//       children: [
//         AspectRatio(
//           aspectRatio: 16 / 9,
//           child: Container(
//             decoration: BoxDecoration(
//               color: onBackgroundColor(context: context).withOpacity(0),
//             ),
//             child: Center(
//               child: LoadingAnimationWidget.stretchedDots(
//                 color: backgroundColor(context: context),
//                 size: 40,
//               ),
//             ),
//           ),
//         ),
//         // const SizedBox(height: 10),
//         // Padding(
//         //   padding: kMainPadding,
//         //   child: Shimmer.fromColors(
//         //     baseColor: onBackgroundColor(context: context).withOpacity(0.1),
//         //     highlightColor:
//         //         onBackgroundColor(context: context).withOpacity(0.3),
//         //     child: Container(
//         //       width: 140,
//         //       height: 18,
//         //       decoration: BoxDecoration(
//         //         borderRadius: kMainBorderRadius / 2,
//         //         color: backgroundColor(context: context),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         Expanded(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: List.generate(
//                 5,
//                 (index) => Padding(
//                   padding: kMainPadding,
//                   child: const AnimeEpisodeCardShimmer(),
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
