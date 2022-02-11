import 'package:dio/dio.dart';
import 'package:quantum_comanda/modules/core/error/failure_log.dart';
import 'package:quantum_comanda/modules/core/service/api_quantum_comanda.dart';
import 'package:quantum_comanda/modules/login/infra/datasources/loggin_datasource.dart';
import 'package:quantum_comanda/modules/login/infra/models/user_model.dart';

class LogginService implements LogginDatasource {
  final Dio req;

  LogginService(this.req);

  @override
  Future<String> validateUser(UserModel userModel) async {
    String result;
    try {
      String url = ServerBase.logginServiceUrl(
        userModel.id.toString(),
        userModel.password,
      );

      result = "";

      final res = await req.get(url);

      if (res.statusCode == 200) {
        final map = res.data;
        final maps = map!["result"];
        result = maps?.toList()[0]["nome"];
      }
    } catch (ex, st) {
      Failure.log(ex, st);
      result = "";
    }
    return result;
  }
}
