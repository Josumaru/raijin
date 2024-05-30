import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_download_model.freezed.dart';

@freezed
abstract class AnimeDownloadModel with _$AnimeDownloadModel{
  const AnimeDownloadModel._();
  const factory AnimeDownloadModel({
    required String title,
    required String saveDir,
    required int progress,
  }) = _AnimeDownloadModel;
}