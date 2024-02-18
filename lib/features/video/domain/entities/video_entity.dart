class VideoEntity {
  final String poster, endpoint, codename;
  final int episode, season, part;

  const VideoEntity({
    required this.poster,
    required this.endpoint,
    required this.codename,
    required this.episode,
    required this.part,
    required this.season,
  });
}
