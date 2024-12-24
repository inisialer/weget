// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HomeScreenFormValidation extends StatefulWidget {
  const HomeScreenFormValidation({Key? key}) : super(key: key);

  @override
  State<HomeScreenFormValidation> createState() =>
      _HomeScreenFormValidationState();
}

class _HomeScreenFormValidationState extends State<HomeScreenFormValidation> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> errorMessage = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _username,
              decoration: InputDecoration(
                  labelText: 'Username',
                  errorText: errorMessage.isEmpty ||
                          errorMessage['data'] == null ||
                          errorMessage['data']['username'] == null
                      ? null
                      : errorMessage['data']['username'][0]),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: errorMessage.isEmpty ||
                          errorMessage['data'] == null ||
                          errorMessage['data']['password'] == null
                      ? null
                      : errorMessage['data']['password'][0]),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    errorMessage = {
                      "status": 400,
                      "data": {
                        "password": ["Password tidak boleh kosong dari api"],
                        "username": ["Username tidak boleh kosong dari api"],
                      }
                    };
                  });
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
