import 'package:quantum_comanda/modules/login/domain/unities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required String password,
  }) : super(name: name, password: password);

  factory UserModel.fromUnity(User user) {
    return UserModel(name: user.name, password: user.password);
  }
}
