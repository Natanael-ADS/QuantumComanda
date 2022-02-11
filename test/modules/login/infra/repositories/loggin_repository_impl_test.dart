import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quantum_comanda/modules/login/domain/unities/user.dart';
import 'package:quantum_comanda/modules/login/infra/datasources/loggin_datasource.dart';
import 'package:quantum_comanda/modules/login/infra/repositories/loggin_repository_impl.dart';

import 'loggin_repository_impl_test.mocks.dart';

@GenerateMocks([LogginDatasource])
void main() {
  final datasource = MockLogginDatasource();
  final repository = LogginRepositoryImpl(datasource);
  testWidgets('erro - loggin repository impl ...', (tester) async {
    when(datasource.validateUser(any)).thenThrow(Exception());

    final actual = await repository.validate(User(
      name: 'teste',
      password: 'teste',
    ));
    expect(actual, isEmpty);
  });

  testWidgets('success - loggin repository impl ...', (tester) async {
    when(datasource.validateUser(any)).thenAnswer((realInvocation) async {
      return "1";
    });

    final actual = await repository.validate(User(
      name: 'teste',
      password: 'teste',
    ));
    expect(actual, isNotEmpty);
  });
}
