// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nhs/screens/diary/diary.dart';
import 'package:nhs/screens/diseases/chat_screen.dart';
import 'package:nhs/screens/home/home_page.dart';
import 'package:nhs/screens/profile/profile_page.dart';
import 'package:nhs/screens/step_tracker/step_tracker_page.dart';
import 'package:nhs/screens/wrapper.dart';
import 'package:nhs/services/auth.dart';

class BotNavBar extends StatefulWidget {
  final String? selectGender;
  const BotNavBar({Key? key, this.selectGender}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 20);

    return Scaffold(
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
                                              builder: (context) => Wrapper(
                                                    key: widget.key,
                                                  )),
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
      drawer: Drawer(
        child: Material(
          //color: Color.fromRGBO(50, 75, 205, 1),
          color: Colors.white,
          child: ListView(
            padding: padding,
            children: [
              DrawerHeader(
                child: Image.asset(
                  'assets/logo1.png',
                ),
              ),
              buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () {
                  Navigator.pop(context);
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              const Divider(
                color: Colors.black,
              ),
              buildMenuItem(
                  text: 'Diary',
                  icon: Icons.book,
                  onClicked: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 1;
                    });
                  }),
              const Divider(
                color: Colors.black,
              ),
              buildMenuItem(
                  text: 'Steps',
                  icon: Icons.run_circle_sharp,
                  onClicked: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 3;
                    });
                  }),
              const Divider(
                color: Colors.black,
              ),
              buildMenuItem(
                text: 'Workouts',
                icon: Icons.fitness_center,
                onClicked: () => Navigator.pushNamed(context, '/workoutspage'),
              ),
              const Divider(
                color: Colors.black,
              ),
              buildMenuItem(
                text: 'Meditation',
                icon: MaterialCommunityIcons.meditation,
                onClicked: () =>
                    Navigator.pushNamed(context, '/meditationpage'),
              ),
              const Divider(
                color: Colors.black,
              ),
              buildMenuItem(
                  text: 'Diseases',
                  icon: Icons.health_and_safety_sharp,
                  onClicked: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 2;
                    });
                  }),
              const Divider(
                color: Colors.black,
              ),
              buildMenuItem(
                  text: 'Profile',
                  icon: Icons.person,
                  onClicked: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 4;
                    });
                  }),
            ],
          ),
        ),
      ),
      body: buildpages(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF9FAFB),
        fixedColor: const Color(0xFF0D47A1),
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_sharp),
            label: 'Diseases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.run_circle_sharp),
            label: 'Steps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildpages() {
    switch (_currentIndex) {
      case 0:
        return HomePage(
          gender: widget.selectGender,
        );
        break;
      case 1:
        return Diary(
          gender: widget.selectGender,
        );
        break;
      case 2:
        return const ChatScreen();
        break;
      case 3:
        return const StepTrackerPage();
        break;
      case 4:
        return ProfilePage();
        break;
      default:
        return Container();
    }
    return Container();
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    const hoverColor = Colors.grey;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
