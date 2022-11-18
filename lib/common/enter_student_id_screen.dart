import 'dart:ffi';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_ui/resource/app_config.dart';
import 'package:student_ui/student/student_home_screen.dart';
import 'package:student_ui/widgets/white_container.dart';

import '../parent/parent_home_screen.dart';
import '../teacher/teacher_home_screen.dart';
import '../widgets/border_box.dart';

class StudentIDScreen extends StatefulWidget {
  const StudentIDScreen({Key? key}) : super(key: key);

  @override
  State<StudentIDScreen> createState() => _StudentIDScreenState();
}

class _StudentIDScreenState extends State<StudentIDScreen> {
  var _formKey = GlobalKey<FormState>();
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/student_id_guy.svg';
    return ColorfulSafeArea(
        color: const Color(0xFF8C4AF2),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFF8C4AF2),
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 50),
                        child: SvgPicture.asset(
                          assetName,
                          placeholderBuilder: (context) {
                            return Container(
                              height: 220,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      WhiteContainer(
                        labelText:
                            "Enter your ${AppConfig.of(context)!.buildFlavor} ID which you received from your class teacher",
                        headerText: AppConfig.of(context)!.buildFlavor ==
                                    "Student" ||
                                AppConfig.of(context)!.buildFlavor == "Parent"
                            ? "Enter ${AppConfig.of(context)!.buildFlavor}'s ID here"
                            : "Enter Class Code",
                        child: BorderBox(
                          margin: false,
                          color: Colors.grey.shade200,
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _textController,
                                onChanged: (value) {
                                  if (value.length == 8) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter ID";
                                  } else if (value.length != 8) {
                                    return "Enter a valid 8 digit ID";
                                  }
                                },
                                autofocus: true,
                                keyboardType: TextInputType.numberWithOptions(),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(8),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter ID here"),
                                style: const TextStyle(fontSize: 18),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: Colors.white,
              child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      saveStudentID();
                    }
                  },
                  child: const BorderBox(
                    margin: false,
                    color: Color(0xFF8C4AF2),
                    height: 50,
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
            ),
          ),
        ));
  }

  saveStudentID() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences
        .setString("studentID", _textController.text)
        .whenComplete(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            switch (AppConfig.of(context)!.buildFlavor) {
              case "Student":
                return StudentHomeScreen(stuID: _textController.text);
              case "Parent":
                return ParentHomeScreen(stuID: _textController.text);
              case "Teacher":
                return TeacherHomeScreen(stuID: _textController.text);
            }
            return StudentHomeScreen(stuID: _textController.text);
          },
      ),
      );
    });
  }
}
