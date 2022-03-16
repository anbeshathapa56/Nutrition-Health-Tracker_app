import 'package:flutter/material.dart';
import 'package:nhs/shared/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String gender;

  const IconContent({Key? key, required this.icon, required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(gender, style: labelTextStyle),
      ],
    );
  }
}
