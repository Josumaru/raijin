
import 'package:dartz/dartz.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetDownloadUseCase {
  final AnimeRepository animeRepository;
  AnimeGetDownloadUseCase({required this.animeRepository});
  
  Future<Either<Failure<String>, List<DownloadTask>>> call() async {
    return await animeRepository.animeGetDownload();
  }
  
}
