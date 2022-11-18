import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/common/achievements_screen.dart';
import 'package:student_ui/common/activity_screen.dart';
import 'package:student_ui/common/attendance_screen.dart';
import 'package:student_ui/common/chat_screen.dart';
import 'package:student_ui/widgets/choose_option.dart';
import 'package:student_ui/common/profile_screen.dart';
import 'package:student_ui/common/tasks_screen.dart';
import 'package:student_ui/student/student_tests_screen.dart';
import 'package:student_ui/common/time_table_screen.dart';

import '../models/choice_model.dart';

class StudentHomeScreen extends StatefulWidget {
  final String stuID;

  const StudentHomeScreen({Key? key, required this.stuID}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final String assetName = "assets/icons/add_stu.svg";

  List<Choice> choice = [
    Choice(
        image: Image.asset(
          "assets/icons/attendance.png",
          height: 45,
          width: 45,
        ),
        title: "Attendance"),
    Choice(
        image: Image.asset(
          "assets/icons/tasks.png",
          height: 45,
          width: 45,
        ),
        title: "Tasks"),
    Choice(
        image: Image.asset(
          "assets/icons/tests.png",
          height: 45,
          width: 45,
        ),
        title: "Tests"),
    Choice(
        image: Image.asset(
          "assets/icons/activity.png",
          height: 45,
          width: 45,
        ),
        title: "Activity"),
    Choice(
        image: Image.asset(
          "assets/icons/timetable.png",
          height: 45,
          width: 45,
        ),
        title: "Time Table"),
    Choice(
        image: Image.asset(
          "assets/icons/chat.png",
          height: 45,
          width: 45,
        ),
        title: "Chat"),
    Choice(
        image: Image.asset(
          "assets/icons/achievements.png",
          height: 45,
          width: 45,
        ),
        title: "Achievements"),
  ];

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color: const Color(0xFF8C4AF2),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFF8C4AF2),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Hey Rohan",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: Colors.white)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("ID: ${widget.stuID}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16))
                            ],
                          ),
                          GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const ProfileScreen())),
                              child: SvgPicture.asset(assetName))
                        ],
                      ),
                      const SizedBox(height: 19),
                      const Text("Highlights",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.white)),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Biology Test: Chapter 6,7 or 8",
                            "Essay writing competition",
                            "Quick quiz"
                          ]
                              .map((filter) => ChooseOption(text: filter))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Choose Category",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20)),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: GridView.count(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            childAspectRatio: 1.016,
                            controller:
                                ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 30.0,
                            children: List.generate(
                              choice.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    switch (index) {
                                      case 0:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AttendanceScreen()));
                                        break;
                                      case 1:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TasksScreen()));
                                        break;
                                      case 2:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StudentTestsScreen()));
                                        break;
                                      case 3:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ActivityScreen()));
                                        break;
                                      case 4:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TimeTableScreen()));
                                        break;
                                      case 5:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChatScreen()));
                                        break;
                                      case 6:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AchievementsScreen()));
                                        break;
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.grey.shade100,
                                        ),
                                        margin: const EdgeInsets.all(10.0),
                                        child:
                                            Center(child: choice[index].image),
                                      ),
                                      Text(
                                        choice[index].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
