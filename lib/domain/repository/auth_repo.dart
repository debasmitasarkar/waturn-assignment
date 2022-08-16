import 'package:walturn/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> authenticate(String email, String password);
}
