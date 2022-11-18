import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_ui/common/onboarding_screen.dart';
import 'package:student_ui/resource/app_config.dart';
import 'package:student_ui/teacher/teacher_attendance_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConfig.of(context)?.appTitle ?? "Something",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnBoardingScreen()
    );
  }
}
