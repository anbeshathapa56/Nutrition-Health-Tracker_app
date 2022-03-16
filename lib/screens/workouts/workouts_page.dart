import 'package:flutter/material.dart';
import 'package:nhs/screens/wrapper.dart';
import 'package:nhs/services/auth.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
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
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Wrapper()),
                                          (route) => false);
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/beginnerworkoutpage');
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/wout2.jpg'),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Color(0x60212121), BlendMode.darken),
                    ),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                  width: double.maxFinite,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 10, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Beginners Workout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'FullBody',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/intermediateworkoutpage');
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/wout4.jpg'),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Color(0x60212121), BlendMode.darken),
                    ),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                  width: double.maxFinite,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 10, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Intermediate Workout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'FullBody',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/wout5.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Color(0x60212121), BlendMode.darken),
                  ),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey,
                ),
                width: double.maxFinite,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 8, 10, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Advanced Workout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'FullBody',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
