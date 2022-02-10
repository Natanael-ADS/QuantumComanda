import 'package:quantum_comanda/modules/login/domain/unities/user.dart';

abstract class LogginRepository {
  Future<String> validate(User user);
}
