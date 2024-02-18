import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/detail/data/datasources/remote/detail_remote_data_source.dart';
import 'package:raijin/features/detail/data/models/detail_model.dart';
import 'package:raijin/features/detail/domain/entities/detail_entity.dart';
import 'package:raijin/features/detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {

  final DetailRemoteDataSource detailRemoteDataSource;

  const DetailRepositoryImpl({required this.detailRemoteDataSource});

  @override
  Future<Either<Failure, DetailEntity>> getDetail({required String endpoint}) async {
    try {
      final DetailModel detailModel = await detailRemoteDataSource.getDetail(endpoint: endpoint);
      final DetailEntity detailEntity = detailModel;
      return Right(detailEntity);
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

}