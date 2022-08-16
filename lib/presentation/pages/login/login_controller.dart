import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walturn/data/datasource/remote_datasource.dart';
import 'package:walturn/data/repository/auth_repo_impl.dart';
import 'package:walturn/domain/entities/user_entity.dart';
import 'package:walturn/domain/usecases/authenticate_usecase.dart';

enum LoginScreenState { initial, loading, success, error }

final StateProvider<LoginScreenState> loginScreenStateProvider =
    StateProvider((ref) => LoginScreenState.initial);

final Provider<LoginController> loginControllerProvider =
    Provider((ref) => LoginController(ref));

class LoginController {
  Ref ref;
  LoginController(this.ref);
  AuthenticateUsecase useCase =
      AuthenticateUsecase(AuthRepoImpl(RemoteDataSource()));
  void authenticate(String email, String password) async {
    ref.read(loginScreenStateProvider.notifier).state =
        LoginScreenState.loading;
    try {
      await useCase.exceute(email, password);
      ref.read(loginScreenStateProvider.notifier).state =
          LoginScreenState.success;
    } catch (e) {
      ref.read(loginScreenStateProvider.notifier).state =
          LoginScreenState.error;
    }
  }
}
