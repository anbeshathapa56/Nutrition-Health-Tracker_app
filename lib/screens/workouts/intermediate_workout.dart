import 'package:flutter/material.dart';
import 'package:nhs/screens/wrapper.dart';
import 'package:nhs/services/auth.dart';

class IntermediateWorkout extends StatefulWidget {
  const IntermediateWorkout({Key? key}) : super(key: key);

  @override
  State<IntermediateWorkout> createState() => _IntermediateWorkoutState();
}

class _IntermediateWorkoutState extends State<IntermediateWorkout> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue[900]),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/heeltouch.jpg",
                        height: 150,
                        width: 150,),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Heel Touch",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "*20 =>3reps",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                    ],
                  ),
                    ],
                  ),
                  Row(

                    children: [
                      Image.asset("assets/bicycle.jpg",
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bicycle Crunch',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "*40 =>3reps",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/side plank.jpg',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Side Plank(left and right)',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          Text("*30 =>3 reps",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/v-up.jpg',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('V-up',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          Text("*40 =>3 reps",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/mountain.jpg',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: const [
                          Text('Mountain Climbers',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          Text("*35 =>4 reps",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/crossover.jpg',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Crossover Crunches',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),),
                          Text("*30 =>3 reps",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
