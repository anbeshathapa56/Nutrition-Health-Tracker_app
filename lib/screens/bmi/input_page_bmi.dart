import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nhs/screens/bmi/reusable_card.dart';
import 'package:nhs/services/auth.dart';

import 'package:nhs/shared/constants.dart';

import 'bmi_result.dart';

import 'calculator_brain.dart';
import 'icon_content.dart';

const Color inActiveCardColor = Color(0xFF0D47A1);
const Color activeCardColor = Color(0xFF2196F3);
const Color bottomContainerColor = Color(0xFF2196F3);

enum Gender { male, female }

class InputPageBmi extends StatefulWidget {
  const InputPageBmi({Key? key}) : super(key: key);

  @override
  _InputPageBmiState createState() => _InputPageBmiState();
}

class _InputPageBmiState extends State<InputPageBmi> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue[900]),
          elevation: 0.0,
          actions: [
            TextButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          color: Colors.white,
                          height: 129,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Are you sure you want to Logout?',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () async {
                                        await _auth.signOut();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.person,
                color: Colors.blue[900],
              ),
              label: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.blue[900],
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColor
                            : inActiveCardColor,
                        iconContent: const IconContent(
                          icon: FontAwesomeIcons.mars,
                          gender: "MALE",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                          colour: selectedGender == Gender.female
                              ? activeCardColor
                              : inActiveCardColor,
                          iconContent: const IconContent(
                            icon: FontAwesomeIcons.venus,
                            gender: "FEMALE",
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: inActiveCardColor,
                iconContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "HEIGHT",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        const Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF90A4AE),
                        thumbColor: bottomContainerColor,
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 200.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveCardColor,
                      iconContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: numberTextStyle,
                              ),
                              const Text(
                                "kg",
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.blue[900],
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                fillColor: const Color(0xFFFFFFFF),
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                  height: 46.0,
                                  width: 46.0,
                                ),
                              ),
                              RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.blue[900],
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                fillColor: const Color(0xFFFFFFFF),
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                  height: 46.0,
                                  width: 46.0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveCardColor,
                      iconContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.blue[900],
                                ),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                fillColor: const Color(0xFFFFFFFF),
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                  height: 46.0,
                                  width: 46.0,
                                ),
                              ),
                              RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.blue[900],
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                fillColor: const Color(0xFFFFFFFF),
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                  height: 46.0,
                                  width: 46.0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 120.0,
                right: 120.0,
              ),
              child: ElevatedButton(
                child: const Text(
                  'Calculate Your BMI',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                ),
                onPressed: () {
                  CalculatorBrainBmi calc =
                      CalculatorBrainBmi(height: height, weight: weight);

                  bmiIndex = calc.calculateBmi();
                  String bmiResult = calc.getResult();
                  String bmiSuggestion = calc.getSuggestions();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPageBmi(
                                bmiResult: bmiResult,
                                bmiIndex: bmiIndex,
                                bmiSuggestion: bmiSuggestion,
                              )));
                },
              ),
            )
          ],
        ));
  }
}

String bmiIndex = '';
