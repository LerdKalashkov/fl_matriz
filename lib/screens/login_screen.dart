import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:fl_matriz/widgets/widgets.dart';
import 'package:fl_matriz/ui/ui_decorations.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:fl_matriz/providers/providers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 220),
            CardContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text('Number',
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 20),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final inputController = TextEditingController();
    final number = Provider.of<MatrixFunctionsProvider>(context);

    void navigator() => Navigator.pushReplacementNamed(context, 'home');

    return Column(
      children: [
        const SizedBox(height: 30),
        Form(
          key: loginForm.formKey,
          child: TextFormField(
            maxLength: 1,
            autocorrect: true,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[2-9]{1}")),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecorations.authInputDecoration(
              hintText: '2 - 9',
              labelText: 'Write a numer from 2 to 9',
              prefixIcon: Icons.numbers,
            ),
            onChanged: (value) {
              loginForm.number = value;
              number.nums = value;
            },
            validator: (value) {
              return (value != null && value.isNotEmpty)
                  ? null
                  : 'You should write at valid number';
            },
          ),
        ),
        const SizedBox(height: 30),
        MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            onPressed: () {
              FocusScope.of(context).unfocus();
              log(loginForm.isValidForm().toString());
              if (loginForm.isValidForm()) {
                navigator();
                number.create();
              } else {
                return;
              }
            },
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 60,
                child: const Text(
                  'Next',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
