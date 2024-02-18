import 'package:raijin/features/detail/data/models/detail_model.dart';

abstract class DetailRemoteDataSource {
  Future<DetailModel> getDetail({required String endpoint});
}