import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nhs/screens/authenticate/google_sign_in.dart';
import 'package:nhs/services/auth.dart';
import 'package:nhs/shared/constants.dart';
import 'package:nhs/shared/loading.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView})
      : super(key: key); // constructor for widget
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    if (loading) {
      return const Loading();
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
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
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
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
                            .registerWithEmailAndPassword(email, password);
                        Navigator.pushNamed(context, '/verifyemail');
                        if (result == null) {
                          setState(() {
                            error = 'Please supply a valid email';
                            loading = false;
                          });
                        } // home page shown automatically through stream setup which is listening for auth changes
                      }
                    },
                    child: const Text(
                      'Register',
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
                    height: 5.0,
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
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
                            'Sign Up with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFD8DDE9),
                        onPrimary: Colors.black,
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
                        text: 'Already have an account? Tap here!',
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
}
