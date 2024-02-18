import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/detail/domain/entities/detail_entity.dart';

abstract class DetailRepository {
  Future<Either<Failure, DetailEntity>> getDetail({required String endpoint});
}