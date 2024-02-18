import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/features/detail/domain/entities/episode_entity.dart';
import 'package:raijin/features/video/presentation/bloc/video_bloc.dart';


class EpisodeWidget extends StatefulWidget {
  EpisodeWidget({
    super.key,
    required this.episodeEntity,
    required this.episode,
    required this.selected
  });



  final EpisodeEntity episodeEntity;
  final int episode;
  bool selected;

  @override
  State<EpisodeWidget> createState() => _EpisodeWidgetState();
}

class _EpisodeWidgetState extends State<EpisodeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!widget.selected){
          context.read<VideoBloc>().add(GetVideoEvent(episodeEntity: widget.episodeEntity));
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: widget.selected ? Theme.of(context).primaryColor.withOpacity(0.7) : Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
            '${widget.episode}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}