import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final String? title, thumbnail, endpoint, date;
  final int? episode;

  const AnimeEntity({
    required this.title,
    required this.thumbnail,
    required this.endpoint,
    required this.date,
    required this.episode,
  });
  
  @override
  List<Object?> get props => [
    title,
    thumbnail,
    endpoint,
    date,
    episode,
  ];
}
