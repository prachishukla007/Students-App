import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_ui/resource/app_config.dart';

import '../parent/parent_home_screen.dart';
import '../student/student_home_screen.dart';
import '../teacher/teacher_home_screen.dart';
import 'login_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => initializeUser(context));
  }

  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) async {
        if (user == null) {
          print('user is signed out');

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
          );
        }
        else {
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          String? studentID = sharedPreferences.getString("studentID");
          _navigate(stuID: studentID!);
          print('user has signed in');
        }
      },
    );
  }

  _navigate({required String stuID}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (AppConfig.of(context)!.buildFlavor) {
            case "Student":
              return StudentHomeScreen(stuID: stuID);
            case "Parent":
              return ParentHomeScreen(stuID: stuID);
            case "Teacher":
              return TeacherHomeScreen(stuID: stuID);
          }
          return StudentHomeScreen(stuID: stuID);
        },
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    String assetName = AppConfig.of(context)!.logo;
    return ColorfulSafeArea(
        color: const Color(0xFF8C4AF2),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFF8C4AF2),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                ),
                SvgPicture.asset(assetName),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
