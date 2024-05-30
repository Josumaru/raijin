import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_donwload_bloc/anime_download_bloc.dart';

class DownloadWidget extends StatefulWidget {
  const DownloadWidget({super.key});
  @override
  State<DownloadWidget> createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _fetchDownload();
    });
  }

  void _fetchDownload() {
    context
        .read<AnimeDownloadBloc>()
        .add(const AnimeDownloadEvent.getDownload());
  }

  @override
  Widget build(BuildContext context) {
    _fetchDownload();

    return Scaffold(
      body: SafeArea(child: BlocBuilder<AnimeDownloadBloc, AnimeDownloadState>(
        builder: (context, state) {
          if (state.task.isEmpty) {
            return Center(
              child: Text(
                'Empty Video',
                style: bodySmall(context: context),
              ),
            );
          }
          return Padding(
            padding: kHorizontalPadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: kCrossAxisAlignmentStart(),
                children: [
                  Text(
                    'Download',
                    style: bodyLarge(context: context),
                  ),
                  Column(
                    mainAxisAlignment: kMainAxisAligmentStart(),
                    crossAxisAlignment: kCrossAxisAlignmentStart(),
                    children: List.generate(state.task.length, (index) {
                      final task = state.task[index];
                      return Padding(
                        padding: kAllPadding,
                        child: Row(
                          children: [
                            Padding(
                              padding: kRightPadding,
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: () {
                                    if (task.status.name == 'complete') {
                                      return Icon(
                                        Iconsax.play,
                                        color:
                                            onBackgroundColor(context: context),
                                      );
                                    } else if (task.status.name == 'failed') {
                                      return InkWell(
                                        onTap: () {
                                          context.read<AnimeDownloadBloc>().add(
                                                AnimeDownloadEvent
                                                    .retryDownload(
                                                  taskId: task.taskId,
                                                ),
                                              );
                                        },
                                        borderRadius: kMainBorderRadius,
                                        child: const Icon(
                                          Iconsax.refresh,
                                          color: Colors.amber,
                                        ),
                                      );
                                    } else {
                                      return Stack(
                                        children: [
                                          CircularProgressIndicator(
                                            color:
                                                primaryColor(context: context)
                                                    .withOpacity(
                                              0.7,
                                            ),
                                            strokeWidth: 1.5,
                                            value: task.progress / 100,
                                          ),
                                          () {
                                            if (task.status.name == 'running') {
                                              return InkWell(
                                                borderRadius:
                                                    kMainCircleBorderRadius,
                                                onTap: () {
                                                  context
                                                      .read<AnimeDownloadBloc>()
                                                      .add(
                                                        AnimeDownloadEvent
                                                            .pauseDownload(
                                                                taskId: task
                                                                    .taskId),
                                                      );
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    Iconsax.pause,
                                                    size: 14,
                                                    color: onBackgroundColor(
                                                      context: context,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return InkWell(
                                              borderRadius:
                                                  kMainCircleBorderRadius,
                                              onTap: () {
                                                context
                                                    .read<AnimeDownloadBloc>()
                                                    .add(
                                                      AnimeDownloadEvent
                                                          .resumeDownload(
                                                        taskId: task.taskId,
                                                      ),
                                                    );
                                              },
                                              child: Center(
                                                child: Icon(
                                                  Iconsax.play,
                                                  size: 14,
                                                  color: onBackgroundColor(
                                                    context: context,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }()
                                          // `Center(
                                          //   child: Text(
                                          //     task.progress
                                          //         .toString(),
                                          //   ),
                                          // ),`
                                        ],
                                      );
                                    }
                                  }()),
                            ),
                            Column(
                              crossAxisAlignment: kCrossAxisAlignmentStart(),
                              children: [
                                SizedBox(
                                  width:
                                      widthMediaQuery(context: context) * 0.5,
                                  child: Text(
                                    maxLines: 1,
                                    task.filename!.split('Episode').first,
                                  ),
                                ),
                                Text(
                                  'Episode ${task.filename!.split('Episode').last.trim().split(' ').first} | ${task.progress}%',
                                  style: bodySmall(context: context),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                context.read<AnimeDownloadBloc>().add(
                                    AnimeDownloadEvent.removeDownload(
                                        taskId: task.taskId));
                              },
                              borderRadius: kMainBorderRadius,
                              child: const Icon(
                                Iconsax.trash,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
