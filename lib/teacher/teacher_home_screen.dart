import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/common/profile_screen.dart';
import 'package:student_ui/common/tasks_screen.dart';
import 'package:student_ui/student/student_tests_screen.dart';
import 'package:student_ui/common/time_table_screen.dart';
import 'package:student_ui/teacher/teacher_behavior_screen.dart';
import 'package:student_ui/teacher/teacher_tests_screen.dart';

import '../common/achievements_screen.dart';
import '../common/activity_screen.dart';
import 'teacher_attendance_screen.dart';
import '../parent/parent_behavior_screen.dart';

class TeacherHomeScreen extends StatelessWidget {
  final String stuID;
  final String assetName = "assets/icons/add_stu.svg";

  const TeacherHomeScreen({Key? key, required this.stuID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color: Color(0xFF8C4AF2),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF8C4AF2),
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
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
                                height: 5,
                              ),
                              Text("ID: $stuID",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16))
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfileScreen()));
                              },
                              child: SvgPicture.asset(assetName))
                        ],
                      ),
                      const SizedBox(height: 19),
                      Row(
                        children: [
                          const Text("4 Sep 2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.white)),
                          SizedBox(width: 10,),
                          SvgPicture.asset("assets/icons/calendar.svg")
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _daysColumn(day: "Mon", date: "01"),
                          const SizedBox(width: 20,),
                          _daysColumn(day: "Tue", date: "02"),
                          const SizedBox(width: 20,),
                          _daysColumn(day: "Wed", date: "03"),
                          const SizedBox(width: 20,),
                          _daysColumn(day: "Thu", date: "04"),
                          const SizedBox(width: 20,),
                          _daysColumn(day: "Fri", date: "05"),
                          const SizedBox(width: 20,),
                          _daysColumn(day: "Sat", date: "06"),
                          const SizedBox(width: 20,),
                          _daysColumn(day: "Sun", date: "07")
                        ],
                      )
                    ],
                  ),
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
                            physics: BouncingScrollPhysics(),
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
                                                    const TeachersAttendanceScreen()));
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
                                                    const TeacherTestsScreen()));
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
                                                    const TeacherBehaviorScreen()));
                                        break;
                                      case 5:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TimeTableScreen()));
                                        break;
                                      case 6:
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AchievementsScreen()));
                                        break;
                                    }                                  },
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

  Widget _daysColumn({required String day, required String date}) {
    return Column(
      children: [
        Text(day, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: day == "Thu" ? FontWeight.w800 : FontWeight.w400),),
        const SizedBox(height: 10,),
        Text(date, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: date == "04" ? FontWeight.w800 : FontWeight.w400),)
      ],
    );
  }
}

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
        "assets/icons/behaviour.png",
        height: 45,
        width: 45,
      ),
      title: "Behaviour"),
  Choice(
      image: Image.asset(
        "assets/icons/timetable.png",
        height: 45,
        width: 45,
      ),
      title: "Time Table"),
  Choice(
      image: Image.asset(
        "assets/icons/achievements.png",
        height: 45,
        width: 45,
      ),
      title: "Achievements"),
];

class Choice {
  final String title;
  final Image image;

  const Choice({Key? key, required this.image, required this.title});
}
