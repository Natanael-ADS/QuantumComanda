import 'package:flutter_modular/flutter_modular.dart';
import 'package:quantum_comanda/modules/login/domain/status_login.dart';
import 'package:quantum_comanda/modules/login/domain/unities/user.dart';
import 'package:quantum_comanda/modules/login/domain/usecases/loggin_usecase.dart';

class LoginStore {
  final _loggin = Modular.get<LogginUsecase>();

  Future<StatusLogin> access(String login, String password) async {
    final id = login.isEmpty ? 0 : int.parse(login);
    final user = User(id: id, password: password);

    final result = await _loggin(user);
    return result;
  }
}
