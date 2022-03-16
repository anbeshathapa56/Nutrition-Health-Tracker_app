import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget iconContent;

  const ReusableCard(
      {Key? key, required this.colour, required this.iconContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: iconContent,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
