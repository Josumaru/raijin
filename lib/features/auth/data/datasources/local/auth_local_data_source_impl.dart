import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:hive/hive.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl({required this.authBox});
  final Box<AuthModel> authBox;
  @override
  Future<void> deleteUser() async {
    await authBox.deleteAll(authBox.keys);
    print('===================logout===${authBox.values}===logout==============================');
    return;
  }
  
  @override
  Future<void> saveUser({required AuthModel authModel}) async {
    final savedUser = await authBox.put('user', authModel);
    return savedUser;
  }

  @override
  Future<AuthEntity> getUser() async {
    print(await authBox.get('user'));
    final AuthModel authModel = authBox.get('user')!;
    print('Sl-user $authModel');
    return authModel.toEntity(authModel);
  }

}