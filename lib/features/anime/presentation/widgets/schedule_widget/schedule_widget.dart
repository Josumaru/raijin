import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_bookmark_bloc/anime_bookmark_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_schedule_bloc/anime_schedule_bloc.dart'
    as bloc;
import 'package:raijin/features/anime/presentation/cubits/anime_schedule_cubit/anime_schedule_cubit.dart'
    as cubit;
import 'package:raijin/features/anime/presentation/pages/detail_page.dart';
import 'package:shimmer/shimmer.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});
  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kMainPadding,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Release Calendar',
                      style: bodyLarge(context: context),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      7,
                      (index) {
                        final DateTime currentDate = DateTime.now();
                        final DateTime date =
                            currentDate.add(Duration(days: index));
                        final String currentDay =
                            DateFormat('EEEE').format(date);
                        return Padding(
                          padding: kMainPadding,
                          child: InkWell(
                            borderRadius: kMainBorderRadius,
                            onTap: () {
                              context
                                  .read<cubit.AnimeScheduleCubit>()
                                  .select(day: currentDay);
                              context.read<bloc.AnimeScheduleBloc>().add(
                                    bloc.AnimeScheduleEvent.animeGetSchedule(
                                        day: currentDay),
                                  );
                            },
                            child: BlocBuilder<cubit.AnimeScheduleCubit,
                                cubit.AnimeScheduleState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => Container(),
                                  loading: () => const Text(''),
                                  loaded: (day) => ScheduleCardWidget(
                                    isSelected: currentDay.toLowerCase() ==
                                        day.toLowerCase(),
                                    date: date,
                                  ),
                                  error: (message) => Container(),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                BlocBuilder<bloc.AnimeScheduleBloc, bloc.AnimeScheduleState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => Container(),
                      loading: () => _loading(),
                      loaded: (scheduleModel, day) => _loaded(
                        context: context,
                        scheduleModel: scheduleModel,
                        day: day,
                      ),
                      error: (message) => const Center(
                        child: Icon(Iconsax.danger),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _loading() {
    return Shimmer.fromColors(
      baseColor: onBackgroundColor(context: context).withOpacity(0.1),
      highlightColor: onBackgroundColor(context: context).withOpacity(0.3),
      child: SizedBox(
        width: widthMediaQuery(context: context),
        child: Column(
          children: List.generate(
            3,
            (index) => Padding(
              padding: kMainPadding,
              child: Row(
                mainAxisAlignment: kMainAxisAligmentStart(),
                crossAxisAlignment: kCrossAxisAlignmentStart(),
                children: [
                  Padding(
                    padding: kHorizontalPadding,
                    child: Text(
                      '00:00',
                      style: bodyLarge(context: context),
                    ),
                  ),
                  Container(
                    width: widthMediaQuery(context: context) / 3,
                    height: widthMediaQuery(context: context) / 3 * 1.4,
                    decoration: BoxDecoration(
                      borderRadius: kMainBorderRadius,
                      color: primaryColor(context: context),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: kHorizontalPadding,
                      child: Column(
                        mainAxisAlignment: kMainAxisAligmentStart(),
                        crossAxisAlignment: kCrossAxisAlignmentStart(),
                        children: [
                          Padding(
                            padding: kBottomPadding,
                            child: Container(
                              width: 140,
                              height: 18,
                              decoration: BoxDecoration(
                                borderRadius: kMainBorderRadius / 2,
                                color: backgroundColor(context: context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: kBottomPadding,
                            child: Container(
                              width: 140,
                              height: 18,
                              decoration: BoxDecoration(
                                borderRadius: kMainBorderRadius / 2,
                                color: backgroundColor(context: context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: kBottomPadding,
                            child: Container(
                              width: 140,
                              height: 18,
                              decoration: BoxDecoration(
                                borderRadius: kMainBorderRadius / 2,
                                color: backgroundColor(context: context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _loaded({
    required BuildContext context,
    required List<ScheduleModel> scheduleModel,
    required String day,
  }) {
    return SizedBox(
      width: widthMediaQuery(context: context),
      child: Column(
        children: List.generate(
          scheduleModel.length,
          (index) => Padding(
            padding: kMainPadding,
            child: Row(
              mainAxisAlignment: kMainAxisAligmentStart(),
              crossAxisAlignment: kCrossAxisAlignmentStart(),
              children: [
                Container(
                  width: widthMediaQuery(context: context) / 5,
                  padding: kHorizontalPadding,
                  child: Text(
                    scheduleModel[index].east_time,
                    style: bodyLarge(context: context),
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: scheduleModel[index].featured_img_src,
                  imageBuilder: (context, imageProvider) {
                    double width = widthMediaQuery(context: context) / 3;
                    return Container(
                      width: width,
                      height: width * 1.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: kMainBorderRadius,
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: kHorizontalPadding,
                    child: Column(
                      mainAxisAlignment: kMainAxisAligmentStart(),
                      crossAxisAlignment: kCrossAxisAlignmentStart(),
                      children: [
                        Text(
                          scheduleModel[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: bodyLarge(context: context),
                        ),
                        Text(
                          scheduleModel[index].genre,
                          style: bodyMedium(context: context),
                        ),
                        Padding(
                          padding: kTopPadding,
                          child: ElevatedButton(
                            onPressed: () {
                              _goToDetail(
                                context: context,
                                endpoint: scheduleModel[index].url,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: kMainAxisAligmentCenter(),
                              children: const [
                                Icon(
                                  Iconsax.play,
                                  color: Colors.white,
                                ),
                                Text('Play'),
                              ],
                            ),
                          ),
                        ),
                        BlocBuilder<AnimeBookmarkBloc, AnimeBookmarkState>(
                          builder: (context, bookmarkState) {
                            for (var bookmark in bookmarkState.animeList) {
                              if (bookmark.poster ==
                                  scheduleModel[index]
                                      .featured_img_src
                                      .replaceAll(kAnimeEndpoint, '')
                                      .trim()) {
                                return Padding(
                                  padding: kTopPadding,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<AnimeBookmarkBloc>().add(
                                            AnimeBookmarkEvent.removeAnimeList(
                                              poster: scheduleModel[index]
                                                  .featured_img_src
                                                  .split('/')
                                                  .last
                                                  .trim(),
                                            ),
                                          );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          kMainAxisAligmentCenter(),
                                      children: const [
                                        Icon(
                                          Iconsax.archive_add1,
                                          color: Colors.white,
                                        ),
                                        Text('Saved'),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }
                            return Padding(
                              padding: kTopPadding,
                              child: OutlinedButton(
                                onPressed: () {
                                  context.read<AnimeBookmarkBloc>().add(
                                        AnimeBookmarkEvent.addAnimeList(
                                          anime: AnimeModel(
                                            title: scheduleModel[index].title,
                                            endpoint: scheduleModel[index]
                                                .url
                                                .replaceAll(
                                                    '${kAnimeEndpoint}anime/',
                                                    '')
                                                .replaceAll('/', ''),
                                            poster: scheduleModel[index]
                                                .featured_img_src
                                                .split(kAnimeEndpoint)
                                                .last
                                                .trim(),
                                            description:
                                                scheduleModel[index].content,
                                            duration: '',
                                          ),
                                        ),
                                      );
                                },
                                child: Row(
                                  mainAxisAlignment: kMainAxisAligmentCenter(),
                                  children: [
                                    Icon(
                                      Iconsax.archive_add,
                                      color:
                                          onBackgroundColor(context: context),
                                    ),
                                    const Text('Save'),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScheduleCardWidget extends StatelessWidget {
  final bool _isSelected;
  final DateTime _date;

  const ScheduleCardWidget({
    required bool isSelected,
    required DateTime date,
    super.key,
  })  : _isSelected = isSelected,
        _date = date;

  @override
  Widget build(BuildContext context) {
    double width = (widthMediaQuery(context: context) / 5) - (60 / 5);
    return Container(
      width: width,
      height: width * 1.2,
      decoration: BoxDecoration(
        color: primaryColor(context: context).withOpacity(
          _isSelected ? 0.1 : 0.005,
        ),
        border: Border.all(
          color: primaryColor(context: context).withOpacity(
            _isSelected ? 0.5 : 0.3,
          ),
        ),
        borderRadius: kMainBorderRadius,
      ),
      child: Column(
        mainAxisAlignment: kMainAxisAligmentCenter(),
        crossAxisAlignment: kCrossAxisAlignmentCenter(),
        children: [
          Text(
            DateFormat('E').format(_date),
            style: headlineMedium(context: context).copyWith(
              color: _isSelected
                  ? primaryColor(context: context)
                  : onBackgroundColor(context: context),
            ),
          ),
          Text(
            _date.day.toString(),
            style: headlineLarge(context: context).copyWith(
              color: _isSelected
                  ? primaryColor(context: context)
                  : onBackgroundColor(context: context),
            ),
          ),
        ],
      ),
    );
  }
}

_goToDetail({required String endpoint, required BuildContext context}) {
  context.read<AnimeDetailBloc>().add(
        AnimeDetailEvent.animeGetDetail(endpoint: endpoint),
      );
  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
    context,
    screen: const DetailPage(),
    settings: const RouteSettings(name: '/detail'),
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
