import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/anime/data/datasources/local/history/history_local_data_source.dart';
import 'package:raijin/features/anime/presentation/blocs/complete_anime_bloc/complete_anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/history_bloc/history_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/ongoing_anime_bloc/ongoing_anime_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/anime_card.dart';
import 'package:raijin/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:raijin/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:raijin/features/video/data/models/video_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _refresh() async {
      context
          .read<AnimeBloc>()
          .add(const GetOngoingAnimeEvent(page: 1, status: 'ongoing'));
      context
          .read<CompleteAnimeBloc>()
          .add(const GetCompleteAnimeEvent(page: 1, status: 'complete'));
    }

    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      displacement: 20,
      edgeOffset: 10,
      onRefresh: _refresh,
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    Text(
                      'Browse',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Icon(
                      Iconsax.search_normal_14,
                      color: kMainAccentColor,
                      size: 36,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kMainAccentColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            'Action',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<AnimeBloc, AnimeState>(
                builder: (context, state) {
                  if (state is AnimeLoading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  } else if (state is AnimeOngoingLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'New Update',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Spacer(),
                              const Icon(
                                Iconsax.arrow_right_3,
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              state.animeEntity.length,
                              (index) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                  (index == 0) ? 20 : 5,
                                  20,
                                  (index == state.animeEntity.length - 1)
                                      ? 20
                                      : 0,
                                  20,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/detail');
                                    context.read<DetailBloc>().add(
                                          GetDetailEvent(
                                            endpoint: state
                                                .animeEntity[index].endpoint!,
                                          ),
                                        );
                                  },
                                  child: AnimeCard(
                                    animeEntity: state.animeEntity[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: Icon(Iconsax.emoji_sad),
                  );
                },
              ),
              BlocBuilder<CompleteAnimeBloc, CompleteAnimeState>(
                builder: (context, state) {
                  if (state is CompleteAnimeLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        color: kMainAccentColor,
                      ),
                    );
                  } else if (state is CompleteAnimeLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'Complete Anime',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Spacer(),
                              const Icon(
                                Iconsax.arrow_right_3,
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              state.animeEntity.length,
                              (index) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                  (index == 0) ? 20 : 5,
                                  20,
                                  (index == state.animeEntity.length - 1)
                                      ? 20
                                      : 0,
                                  20,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/detail');
                                    context.read<DetailBloc>().add(
                                          GetDetailEvent(
                                            endpoint: state
                                                .animeEntity[index].endpoint!,
                                          ),
                                        );
                                  },
                                  child: AnimeCard(
                                    animeEntity: state.animeEntity[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: Icon(Iconsax.emoji_sad),
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()async {
                  // final user = sl<Box<VideoModel>>().getAt(0);
                  // sl<Box<VideoModel>>().put('key', VideoModel(codename: 'asd'));
                  // final getuser = sl<Box<AuthModel>>().get('user');
                  // final getHistory = await sl<HistoryLocalDataSource>().getHistory();
                  // final setHistory = await sl<HistoryLocalDataSource>().setHistory(videoModel: VideoModel(endpoint: 'asda',codename: '',duration: 12,episode: 2,part: 2 ));
                  // await sl<AuthLocalDataSource>().saveUser(authModel: AuthModel(email: 'asd'));
                context.read<HistoryBloc>().add(SetHistoryEvent(videoModel: VideoModel(codename: '', duration: 13, endpoint: '', episode: 2, part: 2, position: 23, poster: '', season: 2)));
                final history = context.read<HistoryBloc>().add(GetHistoryEvent());
                  // print(history.);
                  // print(getHistory[0].codename);
              
                },
                child: Text('Test')
              ),
            ),
          )
        ],
      ),
    );
  }
}
