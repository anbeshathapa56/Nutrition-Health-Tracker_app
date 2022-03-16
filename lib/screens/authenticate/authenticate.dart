import 'package:flutter/material.dart';
import 'package:nhs/screens/authenticate/register.dart';
import 'package:nhs/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(
          toggleView:
              toggleView); // first toggleview(propertyname) can be any name but second toggleview(value) name should be same\

    } else {
      return Register(toggleView: toggleView);
    }
  }
}
