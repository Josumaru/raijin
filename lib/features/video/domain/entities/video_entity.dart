class VideoEntity {
  final String? poster, endpoint, codename;
  final int? episode, season, part, duration, position;

  const VideoEntity({
    this.poster,
    this.endpoint,
    this.codename,
    this.episode,
    this.part,
    this.season,
    this.duration,
    this.position
  });
}
