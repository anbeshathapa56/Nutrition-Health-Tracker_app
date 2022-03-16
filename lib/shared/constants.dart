import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Color(0xFFD8DDE9),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFD8DDE9),
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 2.0,
    ),
  ),
);

const TextStyle labelTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
);
const TextStyle numberTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.w900,
);
