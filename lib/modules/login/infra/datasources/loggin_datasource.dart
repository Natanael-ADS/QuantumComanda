import '../models/user_model.dart';

abstract class LogginDatasource {
  Future<String> validateUser(UserModel userModel);
}
