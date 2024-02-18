import 'package:dio/dio.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/detail/data/datasources/remote/detail_remote_data_source.dart';
import 'package:raijin/features/detail/data/models/detail_model.dart';

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<DetailModel> getDetail({required String endpoint}) async {
      Response response = await dio.get('$kRaijinEndpoint/api/detail/$endpoint');
      final DetailModel detailModel = DetailModel.fromJson(response.data['data']);
      return detailModel;
  }
}
