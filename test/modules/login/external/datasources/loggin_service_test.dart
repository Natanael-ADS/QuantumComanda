// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quantum_comanda/modules/login/external/datasources/loggin_service.dart';
import 'package:quantum_comanda/modules/login/infra/models/user_model.dart';

import 'loggin_service_test.mocks.dart';

const String RESPONSE =
    '{"result": [{"status":"200","codigo":"100","nome":"Quantum Suporte"}]}';
@GenerateMocks([Dio])
void main() {
  final req = MockDio();
  final service = LogginService(req);

  testWidgets('error - loggin service ...', (tester) async {
    when(req.get(any)).thenThrow(Exception());

    final model = UserModel(name: "teste", password: "teste");
    final actual = await service.validateUser(model);

    expect(actual, isEmpty);
  });

  testWidgets('success - loggin service ...', (tester) async {
    when(req.get(any)).thenAnswer((realInvocation) async {
      return Response(
        requestOptions: RequestOptions(path: ""),
        data: jsonDecode(RESPONSE),
        statusCode: 200,
      );
    });

    final model = UserModel(name: "teste", password: "teste");
    final actual = await service.validateUser(model);

    expect(actual, isNotEmpty);
    expect(actual, "Quantum Suporte");
  });
}
