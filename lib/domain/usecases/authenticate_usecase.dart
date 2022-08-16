import 'package:walturn/domain/entities/user_entity.dart';
import 'package:walturn/domain/repository/auth_repo.dart';

class AuthenticateUsecase {
  final AuthRepo repo;
  AuthenticateUsecase(this.repo);

  Future<UserEntity> exceute(String email, String password) async {
    return await repo.authenticate(email, password);
  }
}
