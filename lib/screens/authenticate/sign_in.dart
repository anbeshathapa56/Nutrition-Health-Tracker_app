import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nhs/services/auth.dart';
import 'package:nhs/shared/constants.dart';
import 'package:nhs/shared/loading.dart';
import 'package:provider/provider.dart';

import 'google_sign_in.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView})
      : super(key: key); // constructor for widget

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth =
      AuthService(); // calling instance of class AuthService (_auth => it can be any name)
  final _formKey = GlobalKey<
      FormState>(); // keeps the track of the form and state of our form

  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

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
                        height: 80.0,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        validator: (val) => val!.length < 8
                            ? 'Enter a password 7+ chars long'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'Could not sign in with those credentials';
                                loading = false;
                              });
                            } // home page shown automatically through stream setup which is listening for auth changes
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Forgot Password?',
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/forgotpassword');
                              }),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        height: 45.0,
                        width: 250.0,
                        child: ElevatedButton(
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/googlelogo.png',
                                height: 45.0,
                                width: 50.0,
                              ),
                              const Text(
                                'Continue with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFD8DDE9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Not registered yet? Tap Here!',
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                widget.toggleView();
                              }),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        error,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
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
