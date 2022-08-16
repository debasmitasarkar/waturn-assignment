import 'package:http/http.dart' as http;
import 'package:walturn/data/models/user_model.dart';

class RemoteDataSource {
  Future<UserModel> authenticate(String email, String password) async {
    // String url = 'https://api-nodejs-todolist.herokuapp.com/user/login';
    var uri = Uri.https('api-nodejs-todolist.herokuapp.com', 'user/login');

    var response = await http.post(
      uri,
      body: {'email': email.trim(), 'password': password.trim()},
    );
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
