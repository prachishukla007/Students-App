import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/big_white_container.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  "Activity",
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
                                        _buildingTestItems(
                                            title: "Essay Writing Competition",
                                            content:
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                            venue: "Nehru Internatonal School"),
                                        _buildingTestItems(
                                          title: "Chess Competition",
                                          content:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                        ),
                                        _buildingTestItems(
                                          title: "Class Decoration",
                                          content:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      )),
                ],
              ))),
    );
  }

  Widget _buildingTestItems(
      {required String title, required content, String? venue}) {
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
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                "20 Sept 2022",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            content,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 12,
          ),
          venue != null
              ? Column(
            children: [
              Row(
                children: [
                  Text(
                    "Venue: ",
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  Text(
                    venue,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              )
            ],
          )
              : Container(),],
      ),
    );
  }
}
