// ignore_for_file: unnecessary_const, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:nhs/screens/meditation/cons.dart';
import 'package:nhs/screens/meditation/image.dart';
import 'package:nhs/screens/meditation/string.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final List<String> _feelingTitleList = [
    "Happy",
    "Angry",
    "Anxious",
    "Sleepy",
    "Sad",
    "Irritated"
  ];
  final List<String> _feelingImgList = [
    AppImages.grinningPng,
    AppImages.angryPng,
    AppImages.anxiousPng,
    AppImages.sleepyPng,
    AppImages.cryingPng,
    AppImages.irritatedPng
  ];

  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: //screens[index],
          Builder(
              builder: (context) => Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        _appBarWidget(),
                        _containerWidget(),
                      ],
                    ),
                  )),
    );
  }

  Widget customPadding(
      {Widget? child,
      EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 30)}) {
    return Container(
      child: child,
      margin: margin,
    );
  }

  Widget _appBarWidget() {
    return customPadding(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Appcolors.borderGeyColors,
                      )),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search the best for you!",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _containerWidget() {
    return Expanded(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 30,
            ),
            customPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        fontSize: 24,
                        color: Appcolors.primaryColors,
                        fontFamily: AppString.normalFontFamily),
                  ),
                ],
              ),
            ),
            customPadding(
              child: Text(
                "How are you feeling?",
                style: TextStyle(
                    fontSize: 24,
                    color: Appcolors.primaryColors,
                    fontFamily: AppString.boldFontFamily),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0),
                  itemCount: _feelingImgList.length,
                  itemBuilder: (context, index) {
                    return _feelingWidget(
                      image: _feelingImgList[index],
                      title: _feelingTitleList[index],
                    );
                  }),
            ),
            customPadding(
              child: Text(
                "Let's Explore",
                style: TextStyle(
                    fontSize: 24,
                    color: Appcolors.primaryColors,
                    fontFamily: AppString.boldFontFamily),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 180,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  _exploreWidget(
                      title: "Guided \nMeditation",
                      description: "16 Sessions",
                      bgImage: AppImages.bg3Png),
                  _exploreWidget(
                      title: "Relax\nand Sleep",
                      description: "24 Sessions",
                      bgImage: AppImages.bg2Png),
                  _exploreWidget(
                      title: "Focus\nEnhancement",
                      description: "21 Sessions",
                      bgImage: AppImages.bg1Png),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _exploreWidget(
      {required String title,
      required String description,
      required String bgImage}) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Stack(
        children: [
          Image.asset(bgImage),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: AppString.boldFontFamily),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Appcolors.primaryColors,
                fontFamily: AppString.normalFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _feelingWidget({required String title, required String image}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 60,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: AppString.normalFontFamily,
                color: Appcolors.primaryColors,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
