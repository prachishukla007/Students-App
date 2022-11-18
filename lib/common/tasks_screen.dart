import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/widgets/big_white_container.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

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
                                child:
                                    SvgPicture.asset("assets/icons/Vector.svg"),
                              )),
                          const Text(
                            "Task",
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
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView(
                            children: [
                              _buildingTaskItem(
                                  title: "Physics",
                                  content:
                                      "Read Chapter: 16.1, 16.2, or make note the same as well",
                                  subtitle: "Submission Date: 28 Sept 2022"),
                              _buildingTaskItem(
                                  title: "History",
                                  content:
                                      "Write an essay on the influences of Shiva ji",
                                  subtitle: "Submission Date: 28 Sept 2022"),
                              _buildingTaskItem(
                                  title: "Biology",
                                  content:
                                      "Read Chapter: 16.1, 16.2, or make note the same as well",
                                  subtitle: "Submission Date: 28 Sept 2022"),
                              _buildingTaskItem(
                                  title: "Biology",
                                  content:
                                      "Read Chapter: 16.1, 16.2, or make note the same as well",
                                  subtitle: "Submission Date: 28 Sept 2022")
                            ],
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildingTaskItem(
      {required String title,
      required String content,
      required String subtitle}) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 8, right: 25),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            content,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade900,
                fontSize: 17),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
          )
        ],
      ),
    );
  }
}
