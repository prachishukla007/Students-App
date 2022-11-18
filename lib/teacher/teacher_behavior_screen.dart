import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/teacher/teacher_behavior_box_screen.dart';
import 'package:student_ui/widgets/big_white_container.dart';

class TeacherBehaviorScreen extends StatefulWidget {
  const TeacherBehaviorScreen({Key? key}) : super(key: key);

  @override
  State<TeacherBehaviorScreen> createState() => _TeacherBehaviorScreenState();
}

class _TeacherBehaviorScreenState extends State<TeacherBehaviorScreen> {
  static List<StudentsListItem> studentsList = [
    StudentsListItem(image: "assets/images/abhinav.png", name: "Sahil Sharma"),
    StudentsListItem(image: "assets/images/abhishek.png", name: "Jatin Mehta"),
    StudentsListItem(image: "assets/images/biologyT.png", name: "Rahul"),
    StudentsListItem(image: "assets/images/engT.png", name: "John Doe"),
    StudentsListItem(image: "assets/images/jayneel.png", name: "Nikhil"),
    StudentsListItem(image: "assets/images/musicT.png", name: "Ajay"),
    StudentsListItem(image: "assets/images/sourav.png", name: "Manish"),
    StudentsListItem(image: "assets/images/udit.png", name: "Aradhya Diwakar"),
    StudentsListItem(image: "assets/images/vinit.png", name: "Vinit Tanwar"),
  ];
  List<StudentsListItem> tempStudentList = List.from(studentsList);

  void updateList(String value) {
    setState(() {
      tempStudentList = studentsList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color: const Color(0xFF8C4AF2),
        child: SafeArea(
            child: Scaffold(
                backgroundColor: const Color(0xFF8C4AF2),
                body: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                        hasScrollBody: true,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 7,
                                              top: 8,
                                              right: 8,
                                              bottom: 8),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/icons/Vector.svg"))),
                                  const Text(
                                    "Behaviour",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 25)
                                ],
                              ),
                            ),
                            BigWhiteContainer(
                              child: Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: TextFormField(
                                        onTap: () {},
                                        onChanged: (value) => updateList(value),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search students here",
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 17),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Expanded(
                                      child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: tempStudentList.length,
                                    itemBuilder: (context, index) {
                                      return _buildingStudentsList(
                                          studentsListItem:
                                              tempStudentList[index]);
                                    },
                                  ))
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ))));
  }

  _buildingStudentsList({required StudentsListItem studentsListItem}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TeacherBehaviorBoxScreen(
                    studentsListItem: studentsListItem)));
          },
          child: Row(
            children: [
              Image.asset(
                studentsListItem.image,
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 10),
              Text(
                studentsListItem.name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 0.5,
        )
      ],
    );
  }

// Widget _buildingTestItems(
//     {required String title,
//       required content,
//       required String image,
//       required String subtitle}) {
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.grey.shade100,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     margin: EdgeInsets.only(bottom: 15),
//     padding: EdgeInsets.all(10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Image.asset(image, height: 50, width: 50,),
//             SizedBox(
//               width: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Text(
//                   subtitle,
//                   style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
//                 )
//               ],
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Text(
//           content,
//           style: const TextStyle(
//               color: Colors.black87,
//               fontSize: 16,
//               fontWeight: FontWeight.w400),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(left: 10, top: 2, right: 5, bottom: 2),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       hintText: "Write Message here!",
//                       hintStyle: TextStyle(color: Colors.grey.shade700),
//                       border: InputBorder.none
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Container(
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: SvgPicture.asset("assets/icons/Vector2.svg", height: 20, width: 20,)
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }
}

class StudentsListItem {
  final String image;
  final String name;

  StudentsListItem({required this.image, required this.name});
}
