import 'package:quantum_comanda/modules/login/domain/unities/user.dart';

import '../../../core/error/failure_log.dart';
import '../repositories/loggin_repository.dart';
import '../status_login.dart';

abstract class LogginUsecase {
  Future<StatusLogin> call(User user);
}

class LogginUsecaseImpl implements LogginUsecase {
  final LogginRepository repository;

  LogginUsecaseImpl(this.repository);

  @override
  Future<StatusLogin> call(User user) async {
    StatusLogin status;
    try {
      status = NotFound();
      String message = await repository.validate(user);
      if (message.isNotEmpty) {
        status = Success();
      }
    } catch (ex, st) {
      Failure.log(ex, st);
      status = ErrorFound();
    }
    return status;
  }
}
