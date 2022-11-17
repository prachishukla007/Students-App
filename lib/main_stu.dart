import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_ui/resource/app_config.dart';
import 'package:student_ui/main.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var configuredApp = AppConfig(
      appTitle: "Students App", buildFlavor: "Student",
      logo: "assets/icons/stu_onboard.svg",
      child: const MyApp());
  return runApp(configuredApp);
}
