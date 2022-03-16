import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nhs/screens/start_screens/intro_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Image.asset('assets/logo1.png'),
      ),
      duration: 3000,
      splashIconSize: 200.0,
      splashTransition: SplashTransition.scaleTransition,
      nextScreen: IntroScreen(),
    );
  }
}
