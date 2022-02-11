import 'package:quantum_comanda/modules/login/domain/unities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String password,
  }) : super(id: id, password: password);

  factory UserModel.fromUnity(User user) {
    return UserModel(id: user.id, password: user.password);
  }
}
