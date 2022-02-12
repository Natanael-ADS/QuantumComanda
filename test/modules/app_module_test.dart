import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:quantum_comanda/modules/app_module.dart';
import 'package:quantum_comanda/modules/login/domain/status_login.dart';
import 'package:quantum_comanda/modules/login/domain/unities/user.dart';
import 'package:quantum_comanda/modules/login/domain/usecases/loggin_usecase.dart';

import 'const_loggin_test.dart';
import 'login/external/datasources/loggin_service_test.mocks.dart';

void main() {
  final mockDio = MockDio();
  initModule(AppModule(), replaceBinds: [
    Bind.instance<Dio>(mockDio),
  ]);
  testWidgets('Loggin user - app module ...', (tester) async {
    when(mockDio.get(any)).thenAnswer((realInvocation) async {
      return Response(
        requestOptions: RequestOptions(path: ''),
        data: jsonDecode(ConstLogginTest.RESPONSE_SUCCESS),
        statusCode: 200,
      );
    });

    final usecase = Modular.get<LogginUsecase>();
    final actual = await usecase(User(id: 100, password: "teste"));
    expect(actual, isA<Success>());
  });
}
