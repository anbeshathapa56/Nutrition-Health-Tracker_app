import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: NetworkImage(
                            user == null ? "" : user.photoURL ?? ''),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user == null ? '' : user.displayName ?? '',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user == null ? '' : user.email ?? '',
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Before you quit, think why you started.',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFF5F5F5),
              height: 30,
              thickness: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: const Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ACCOUNT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF616161),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: Color(0xFF424242),
                      ),
                      label: const Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesome.bell,
                        color: Color(0xFF424242),
                      ),
                      label: const Text(
                        'Notification Settings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Feather.repeat,
                        color: Color(0xFF424242),
                      ),
                      label: const Text(
                        'Update Goals',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFF5F5F5),
              height: 30,
              thickness: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: const Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'HELP AND LEGAL',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF616161),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        MaterialIcons.quick_contacts_mail,
                        size: 25.0,
                        color: Color(0xFF424242),
                      ),
                      label: const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Feather.info,
                        color: Color(0xFF424242),
                      ),
                      label: const Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        MaterialCommunityIcons.file_certificate,
                        size: 30,
                        color: Color(0xFF424242),
                      ),
                      label: const Text(
                        'Terms & Policies',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: const Color(0xFFF5F5F5),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Version 1.0.5',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF424242),
                            ),
                          ),
                        ),
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
