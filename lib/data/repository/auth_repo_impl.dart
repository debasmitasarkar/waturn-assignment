import 'package:walturn/data/datasource/remote_datasource.dart';
import 'package:walturn/domain/entities/user_entity.dart';
import 'package:walturn/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  RemoteDataSource remoteDataSource;
  AuthRepoImpl(this.remoteDataSource);
  @override
  Future<UserEntity> authenticate(String email, String password) async {
    return await remoteDataSource.authenticate(email, password);
  }
}
