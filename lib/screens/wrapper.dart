import 'package:flutter/material.dart';
import 'package:nhs/models/theuser.dart';
import 'package:nhs/screens/authenticate/authenticate.dart';
import 'package:nhs/shared/shared.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser?>(context); // user can be any name

    // return either Home or Authenticate Widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const BotNavBar();
    }
  }
}
