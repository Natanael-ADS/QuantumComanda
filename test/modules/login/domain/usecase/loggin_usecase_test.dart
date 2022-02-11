import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quantum_comanda/modules/login/domain/repositories/loggin_repository.dart';
import 'package:quantum_comanda/modules/login/domain/status_login.dart';
import 'package:quantum_comanda/modules/login/domain/unities/user.dart';
import 'package:quantum_comanda/modules/login/domain/usecases/loggin_usecase.dart';

import 'loggin_usecase_test.mocks.dart';

@GenerateMocks([LogginRepository])
void main() {
  final repository = MockLogginRepository();
  final usecase = LogginUsecaseImpl(repository);
  testWidgets('erro - loggin usecase ...', (tester) async {
    when(repository.validate(any)).thenThrow(Exception());

    final actual = await usecase(User(id: 1, password: 'teste'));

    expect(actual, isA<ErrorFound>());
  });

  testWidgets('NotFound - loggin usecase ...', (tester) async {
    when(repository.validate(any)).thenAnswer((realInvocation) async => "");

    final actual = await usecase(User(id: 1, password: 'teste'));

    expect(actual, isA<NotFound>());
  });

  testWidgets('Success - loggin usecase ...', (tester) async {
    when(repository.validate(any)).thenAnswer((realInvocation) async => "1");

    final actual = await usecase(User(id: 1, password: 'teste'));

    expect(actual, isA<Success>());
  });
}
