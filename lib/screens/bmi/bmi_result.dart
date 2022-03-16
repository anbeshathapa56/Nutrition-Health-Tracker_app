// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nhs/screens/bmi/reusable_card.dart';

import 'input_page_bmi.dart';

class ResultsPageBmi extends StatefulWidget {
  final String bmiResult;
  final String bmiIndex;
  final String bmiSuggestion;

  const ResultsPageBmi(
      {Key? key,
      required this.bmiResult,
      required this.bmiIndex,
      required this.bmiSuggestion})
      : super(key: key);

  @override
  State<ResultsPageBmi> createState() => _ResultsPageBmiState();
}

class _ResultsPageBmiState extends State<ResultsPageBmi> {
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
              Navigator.pushNamed(context, '/botnavbar');
            },
            icon: Icon(
              Icons.home,
              color: Colors.blue[900],
            ),
            label: Text(
              'Home',
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Center(
                child: Text(
                  "Your Result",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 50.0,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: inActiveCardColor,
              iconContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.bmiResult,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.bmiIndex,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 90.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.bmiSuggestion,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 115.0,
              right: 115.0,
            ),
            child: ElevatedButton(
              child: const Text(
                'Re-Calculate',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

String? BmiResultData;
