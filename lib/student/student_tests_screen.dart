import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/widgets/custom_radio_button.dart';
import 'package:student_ui/enums/tests_type.dart';

import '../widgets/big_white_container.dart';

class StudentTestsScreen extends StatefulWidget {
  const StudentTestsScreen({Key? key}) : super(key: key);

  @override
  State<StudentTestsScreen> createState() => _StudentTestsScreenState();
}

class _StudentTestsScreenState extends State<StudentTestsScreen> {
  TestsType testsType = TestsType.upcoming;

  @override
  void initState() {
    testsType = TestsType.upcoming;
    super.initState();
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
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      left: 7, top: 8, right: 8, bottom: 8),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/icons/Vector.svg"))),
                          const Text(
                            "Test",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 25)
                        ],
                      ),
                    ),
                    BigWhiteContainer(
                        child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Flexible(
                              child: CustomRadioButton<TestsType>(
                                  value: TestsType.upcoming,
                                  groupValue: testsType,
                                  onChanges: (value) {
                                    setState(() {
                                      testsType = value!;
                                    });
                                  },
                                  title: "Upcoming Tests"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: CustomRadioButton<TestsType>(
                                  value: TestsType.result,
                                  groupValue: testsType,
                                  onChanges: (value) {
                                    setState(() {
                                      testsType = value!;
                                    });
                                  },
                                  title: "Results"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      testsType == TestsType.upcoming
                          ? Expanded(
                              child: ListView(
                              children: [
                                _buildingTestItems(
                                    title: "History", testsType: testsType),
                                _buildingTestItems(
                                    title: "Biology", testsType: testsType),
                                _buildingTestItems(
                                    title: "Physics", testsType: testsType),
                              ],
                            ))
                          : Expanded(
                              child: ListView(
                              children: [
                                _buildingTestItems(
                                    title: "History",
                                    testsType: testsType,
                                    content: "Chapter 06, 07",
                                    grade: "B+",
                                    date: "28 Sept 2022"),
                                _buildingTestItems(
                                    title: "Biology",
                                    testsType: testsType,
                                    content: "Management of Natural Resources",
                                    grade: "C",
                                    date: "20 Sept 2022"),
                                _buildingTestItems(
                                    title: "Mathematics",
                                    testsType: testsType,
                                    content:
                                        "Chapter 06, Chapter 07 & Chapter 08",
                                    grade: "B+",
                                    date: "19 Sept 2022"),
                                _buildingTestItems(
                                    title: "Social Science",
                                    testsType: testsType,
                                    content: "Chapter 06",
                                    grade: "D",
                                    date: "18 Sept 2022"),
                              ],
                            ))
                    ])),
                  ],
                )),
          ],
        ),
      )),
    );
  }

  Widget _buildingTestItems(
      {required String title,
      String? content,
      String? grade,
      required TestsType testsType,
      String? date}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              ),
              Text(
                testsType == TestsType.upcoming ? "28 Sept 2022" : date!,
                style: TextStyle(color: Colors.grey.shade600),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            testsType == TestsType.upcoming
                ? "Chapter 6 name of that chapter"
                : content!,
            style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
          ),
          SizedBox(
            height: 15,
          ),
          testsType == TestsType.upcoming
              ? Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 11.5, horizontal: 45),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xFF8C4AF2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Available",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 11.5, horizontal: 45),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xFF8C4AF2)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "On Leave",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF8C4AF2),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Text(
                      "Grade: ",
                      style:
                          TextStyle(color: Colors.grey.shade900, fontSize: 16),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      grade!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
