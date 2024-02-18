import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/detail/domain/entities/detail_entity.dart';
import 'package:raijin/features/detail/domain/repositories/detail_repository.dart';

class GetDetailUseCase {
  final DetailRepository detailRepository;

  const GetDetailUseCase({required this.detailRepository});

  Future<Either<Failure, DetailEntity>> call({required String endpoint}) async {
    return await detailRepository.getDetail(endpoint: endpoint);
  }
}