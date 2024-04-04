import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () => const Center(child: CupertinoActivityIndicator()),
              loaded: (animeModel) {
                return _buildBody(animeModel, context);
              },
              error: (message) => Text(message),
            );
          },
        ),
      ),
    );
  }

  _buildBody(AnimeModel animeModel, BuildContext context) {
    return SliverAppBar(
      expandedHeight: heightMediaQuery(context: context) / 2,
      actions: const [],
    );
  }

//   _buildDetail({
//     required AnimeModel animeModel,
//     required BuildContext context,
//   }) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             CachedNetworkImage(
//               imageUrl: animeModel.poster,
//               imageBuilder: (context, imageProvider) {
//                 return Container(
//                   height: heightMediaQuery(context: context) / 2,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             ),
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: gradientListColor(context: context),
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         DefaultTabController(
//           length: 3,
//           child: SizedBox(
//             height: heightMediaQuery(context: context) / 3,
//             child: Column(
//               children: [
//                 TabBar(
//                   splashBorderRadius: kMainBorderRadius,
//                   dividerColor: Theme.of(context).primaryColor.withOpacity(0),
//                   labelStyle: const TextStyle(color: kMainAccentColor),
//                   // indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
//                   tabs: const [
//                     Tab(
//                       child: Text('Overview'),
//                     ),
//                     Tab(
//                       child: Text('Episodes'),
//                     ),
//                     Tab(
//                       child: Text('Details'),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       _buildOverview(animeModel, context),
//                       _buildEpisodes(animeModel),
//                       const SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                             Text('data'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   SingleChildScrollView _buildEpisodes(AnimeModel animeModel) {
//     return SingleChildScrollView(
//       child: Column(
//         children: List.generate(
//           animeModel.episodeList!.length,
//           (index) => ListTile(
//             leading: CachedNetworkImage(
//               imageUrl: animeModel.poster,
//             ),
//             title: Text(animeModel.episodeList![index].title),
//             subtitle: Text(
//               animeModel.episodeList![index].date,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Column _buildOverview(AnimeModel animeModel, BuildContext context) {
//     return Column(
//       crossAxisAlignment: kCrossAxisAlignmentStart(),
//       children: [
//         Padding(
//           padding: kHorizontalPadding,
//           child: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: kCrossAxisAlignmentStart(),
//                   children: [
//                     Text(
//                       animeModel.title,
//                       style: headlineLarge(context: context)
//                           .copyWith(fontSize: 30),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                     ),
//                     Text(
//                       '${animeModel.season!} | ${animeModel.genre![0].replaceFirst(
//                         animeModel.genre![0][0],
//                         animeModel.genre![0][0].toUpperCase(),
//                       )} | ${animeModel.status}',
//                       style: bodySmall(context: context),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           // height: heightMediaQuery(context: context) / 3,
//           child: Padding(
//             padding: kHorizontalPadding,
//             child: Column(
//               crossAxisAlignment: kCrossAxisAlignmentStart(),
//               children: [
//                 Text(
//                   'Synopsis',
//                   style: bodyLarge(context: context),
//                 ),
//                 Text(
//                   animeModel.description!,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
}
