import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quantum_comanda/modules/app_widget.dart';
import 'package:quantum_comanda/modules/login/domain/usecases/loggin_usecase.dart';
import 'package:quantum_comanda/modules/login/external/datasources/loggin_service.dart';
import 'package:quantum_comanda/modules/login/infra/repositories/loggin_repository_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton<Dio>((i) => Dio()),
      Bind.factory((i) => LogginUsecaseImpl(i())),
      Bind.factory((i) => LogginRepositoryImpl(i())),
      Bind.factory((i) => LogginService(i())),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute("/", child: (_, args) => const AppWidget()),
    ];
  }
}
