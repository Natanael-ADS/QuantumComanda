import 'package:flutter/material.dart';
import 'package:quantum_comanda/modules/core/widgets/custom_snackbar.dart';
import 'package:quantum_comanda/modules/login/domain/status_login.dart';
import '../../core/widgets/custom_button_text.dart';
import '../../core/widgets/custom_textfield.dart';
import 'login_store.dart';

class LoginWidget extends StatelessWidget {
  final TextEditingController ctlrLogin = TextEditingController();
  final TextEditingController ctlrPassword = TextEditingController();
  final LoginStore store = LoginStore();

  LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quantum Comanda"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: ctlrLogin,
              hintText: "Digite seu código...",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: ctlrPassword,
              hintText: "Digite sua senha...",
              obscureText: true,
            ),
            const SizedBox(height: 10),
            CustomButtonText(
              onPressed: () async {
                final login = ctlrLogin.text;
                final password = ctlrPassword.text;
                final result = await store.access(login, password);

                if (result is Success) {
                  CustomSnackbar.success(context, "Logado com sucesso");
                } else {
                  CustomSnackbar.error(context, "erro encontrado!");
                }
              },
              title: "Acessar",
            )
          ],
        ),
      ),
    );
  }
}
