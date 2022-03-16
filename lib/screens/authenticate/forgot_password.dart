import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:nhs/shared/constants.dart';
import 'package:nhs/shared/loading.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final auth = FirebaseAuth.instance;

  bool loading = false;

  String email = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key:
                      _formKey, // validate form via accessing validation techniques and states
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo1.png',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          auth.sendPasswordResetEmail(email: email);
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Send Request',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
