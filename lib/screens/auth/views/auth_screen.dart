import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthScreen extends StatelessWidget {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  AuthScreen({super.key});
  final maskFormatter = MaskTextInputFormatter(
  mask: '(###) ##-##-##', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Войдите в MBANK',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              inputFormatters: [maskFormatter],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  prefixText: '+996',
                  labelStyle: const TextStyle(color: Colors.grey),
                  labelText: 'Номер телефона',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.grey),
                  labelText: 'Пароль',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }
}