import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/big_white_container.dart';

class TeacherTestsScreen extends StatefulWidget {
  const TeacherTestsScreen({Key? key}) : super(key: key);

  @override
  State<TeacherTestsScreen> createState() => _TeacherTestsScreenState();
}

class _TeacherTestsScreenState extends State<TeacherTestsScreen> {
  bool isTapped = false;
  List<String> subjects = ["History", "Biology", "Physics"];

  @override
  void initState() {
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
                          const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  padding: const EdgeInsets.only(
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
                          const SizedBox(width: 25)
                        ],
                      ),
                    ),
                    BigWhiteContainer(
                        child: isTapped
                            ? const Center(child: CircularProgressIndicator())
                            : Column(children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                    child: ListView.builder(
                                  itemCount: subjects.length,
                                  itemBuilder: (context, index) {
                                    return _buildingTestItems(
                                        title: subjects[index], index: index);
                                  },
                                ))
                              ])),
                  ],
                )),
          ],
        ),
      )),
    );
  }

  Widget _buildingTestItems({required String title, required int index}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              ),
              Text(
                "28 Sept 2022",
                style: TextStyle(color: Colors.grey.shade600),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Chapter 6 name of that chapter",
            style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 42,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xFF8C4AF2),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Edit Test",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTapped = true;
                    subjects.removeAt(index);
                    Timer(const Duration(seconds: 1), () {
                      setState(() {
                        isTapped = false;
                      });
                    });
                  });
                },
                child: Container(
                  height: 42,
                  width: 150,
                  // padding:
                  //     EdgeInsets.symmetric(vertical: 11.5, horizontal: 45),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: const Color(0xFF8C4AF2)),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF8C4AF2),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
