import 'package:quantum_comanda/modules/core/error/failure_log.dart';
import 'package:quantum_comanda/modules/login/domain/unities/user.dart';
import 'package:quantum_comanda/modules/login/infra/models/user_model.dart';

import '../../domain/repositories/loggin_repository.dart';
import '../datasources/loggin_datasource.dart';

class LogginRepositoryImpl implements LogginRepository {
  final LogginDatasource datasource;

  LogginRepositoryImpl(this.datasource);

  @override
  Future<String> validate(User user) async {
    String result;
    try {
      UserModel model = UserModel.fromUnity(user);
      result = await datasource.validateUser(model);
    } catch (ex, st) {
      Failure.log(ex, st);
      result = "";
    }
    return result;
  }
}
