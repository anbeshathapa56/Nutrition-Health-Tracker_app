import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nhs/services/auth.dart';
import 'package:nhs/shared/constants.dart';
import 'package:nhs/shared/shared.dart';

class CalorieCountingPage extends StatefulWidget {
  const CalorieCountingPage({Key? key}) : super(key: key);

  @override
  State<CalorieCountingPage> createState() => _CalorieCountingPageState();
}

class _CalorieCountingPageState extends State<CalorieCountingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final AuthService _auth = AuthService();

  String activityLevel = 'Activity Level';
  late String valueChooseWG;
  List listItemWG = [
    'Select Weekly Goal',
    'Lose 2 pounds per week',
    'Lose 1.5 pounds per week',
    'Lose 1 pounds per week',
    'Lose 0.5 pounds per week',
    'Maintain my current weight',
    'Gain 0.5 pounds per week',
    'Gain 1 pounds per week',
  ];
  int _malefemaleVal = 1;

  String _malefemaleText = 'Male';

  @override
  void initState() {
    super.initState();
    valueChooseWG = listItemWG[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _ageController,
                      style: const TextStyle(
                        height: 1.0,
                      ),
                      decoration: textInputDecoration.copyWith(hintText: 'Age'),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9]+|\s")),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _heightController,
                      style: const TextStyle(
                        height: 1.0,
                      ),
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Height (cm)'),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9.]+|\s")),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        height: 1.0,
                      ),
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Starting Weight (pounds)'),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9.]+|\s")),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _weightController,
                      style: const TextStyle(
                        height: 1.0,
                      ),
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Current Weight (pounds)'),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9.]+|\s")),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        height: 1.0,
                      ),
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Goal Weight (pounds)'),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9.]+|\s")),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFD8DDE9),
                      ),
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                        child: PopupMenuButton(
                          onSelected: (value) {
                            switch (value) {
                              case 1:
                                setState(() {
                                  activityLevel = '1.2';
                                });
                                break;
                              case 2:
                                setState(() {
                                  activityLevel = '1.37';
                                });
                                break;
                              case 3:
                                setState(() {
                                  activityLevel = '1.55';
                                });
                                break;
                              case 4:
                                setState(() {
                                  activityLevel = '1.725';
                                });
                                break;
                              case 5:
                                setState(() {
                                  activityLevel = '1.9';
                                });
                                break;
                              default:
                                {
                                  debugPrint("Invalid choice");
                                }
                                break;
                            }
                          },
                          offset: const Offset(3, 35),
                          enabled: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                activityLevel,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF111827),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Icon(
                                AntDesign.caretdown,
                                size: 14,
                                color: Color(0xFF111827),
                              ),
                            ],
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              child: Text(
                                "1.2 (Little to no exercise)",
                                style: TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              value: 1,
                            ),
                            const PopupMenuItem(
                              child: Text(
                                "1.37 (Slightly active person who does light exercise 1-3 days a week.",
                                style: TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              value: 2,
                            ),
                            const PopupMenuItem(
                              child: Text(
                                "1.55 (Moderately active person who performs moderate exercise 3-5 days in a week.",
                                style: TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              value: 3,
                            ),
                            const PopupMenuItem(
                              child: Text(
                                "1.725 (Very active person who exercises hard 6-7 days a week.",
                                style: TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              value: 4,
                            ),
                            const PopupMenuItem(
                              child: Text(
                                "1.9 (Extra active person who either has a physically demanding job or has a particularly challenging exercise routine.",
                                style: TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              value: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF0D47A1),
                          ),
                          groupValue: _malefemaleVal,
                          onChanged: (val) {
                            setState(() {
                              _malefemaleVal = 1;
                              _malefemaleText = "Male";
                            });
                          },
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Radio(
                          value: 2,
                          fillColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF0D47A1),
                          ),
                          groupValue: _malefemaleVal,
                          onChanged: (val) {
                            setState(() {
                              _malefemaleVal = 2;
                              _malefemaleText = "Female";
                            });
                          },
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_malefemaleText == "Male") {
                          formenData = (66 +
                                  (6.2 * int.parse(_weightController.text)) +
                                  (12.7 * int.parse(_heightController.text)) -
                                  (6.76 * int.parse(_ageController.text))) *
                              1.55;
                        } else if (_malefemaleText == "Female") {
                          forfemaleData = (655.1 +
                                  (4.35 * int.parse(_weightController.text)) +
                                  (4.7 * int.parse(_heightController.text)) -
                                  (4.7 * int.parse(_ageController.text))) *
                              1.55;
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BotNavBar(
                                      selectGender: _malefemaleText,
                                      key: widget.key,
                                    )));
                      },
                      child: const Text(
                        'Proceed',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double? formenData;
double? forfemaleData;
