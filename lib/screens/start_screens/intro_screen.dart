import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final pageDecoration = PageDecoration(
    titleTextStyle:
        const PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle:
        const PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
    pageColor: Colors.white,
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: SafeArea(
            child: Image.asset(
          "assets/logo1.png",
        )),
        title: "Nutrition & Health Tracker",
        body: "Welcome To NHS",
        footer: const Text(
          "You share, we care",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: SafeArea(child: Image.asset("assets/progress.jpg")),
        title: "Track your Progress",
        body: "Check yourself at Each Phase And Update Your Profile",
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: SafeArea(child: Image.asset("assets/blue women.jpg")),
        title: "Stay Strong & Healthy",
        body: "We want you to stay Strong & Healthy. Enjoy!",
        decoration: pageDecoration,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      curve: Curves.ease,
      pages: getPages(),
      done: const Text(
        "Let's Start",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      showSkipButton: true,
      skip: const Text('Skip'),
      onSkip: () {
        Navigator.pushNamed(context, '/wrapper');
      },
      showNextButton: true,
      next: const Text('Next'),
      onDone: () {
        Navigator.pushNamed(context, '/wrapper');
      },
    );
  }
}
