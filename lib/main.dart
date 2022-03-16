import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nhs/screens/calorie_counting/calorie_counting_page.dart';
import 'package:nhs/screens/diary/diary.dart';
import 'package:nhs/screens/diseases/chat_screen.dart';
import 'package:nhs/screens/meditation/meditation_page.dart';
import 'package:nhs/screens/profile/profile_page.dart';
import 'package:nhs/screens/start_screens/intro_screen.dart';
import 'package:nhs/screens/start_screens/splash.dart';
import 'package:nhs/screens/step_tracker/step_tracker_page.dart';
import 'package:nhs/screens/workouts/beginner_workout.dart';
import 'package:nhs/screens/workouts/intermediate_workout.dart';
import 'package:nhs/screens/workouts/workouts_page.dart';
import 'package:nhs/models/theuser.dart';
import 'package:nhs/screens/authenticate/forgot_password.dart';
import 'package:nhs/screens/authenticate/google_sign_in.dart';
import 'package:nhs/screens/authenticate/verify_email.dart';
import 'package:nhs/screens/bmi/input_page_bmi.dart';
import 'package:nhs/screens/home/home_page.dart';
import 'package:nhs/screens/wrapper.dart';
import 'package:nhs/services/auth.dart';
import 'package:nhs/shared/shared.dart';
import 'package:provider/provider.dart';

void main() async {
  // These two lines
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
        value: AuthService()
            .user, // instance of authservice and accessing user in it
        initialData: null,
        child: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/workoutspage',
            routes: {
              '/': (context) => const Splash(),
              '/introscreen': (context) => IntroScreen(),
              '/botnavbar': (context) => const BotNavBar(
                    selectGender: '',
                  ),
              '/chatscreen': (context) => const ChatScreen(),
              '/wrapper': (context) => const Wrapper(),
              '/homepage': (context) => const HomePage(),
              '/diary': (context) => const Diary(),
              '/steptrackerpage': (context) => const StepTrackerPage(),
              '/workoutspage': (context) => const WorkoutsPage(),
              '/meditationpage': (context) => const MeditationPage(),
              '/caloriecountingpage': (context) => const CalorieCountingPage(),
              '/inputpagebmi': (context) => const InputPageBmi(),
              '/profilepage': (context) => ProfilePage(),
              '/forgotpassword': (context) => const ForgotPassword(),
              '/verifyemail': (context) => const VerifyEmail(),
              '/beginnerworkoutpage': (context) => const BeginnerWorkoutPage(),
              '/intermediateworkoutpage': (context) => const IntermediateWorkout(),
            },
          ),
        ));
  }
}
