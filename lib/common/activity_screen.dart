import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/resource/app_config.dart';

import '../widgets/big_white_container.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  bool isTapped = false;
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
                              child: isTapped ? Center(child: CircularProgressIndicator()) : Expanded(
                            child: ListView.builder(
                              itemCount: activityItems.length,
                                itemBuilder: (context, index) {
                                return _buildingActivityItems(item: activityItems[index], index: index);
                                },

                            ),
                          )),
                        ],
                      )),
                ],
              ))),
    );
  }

  List<Map<String, String>> activityItems = [
    {
      "title" : "Essay Writing Competition",
      "content" : "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "venue" : "Nehru International School"
    },
    {
      "title" : "Chess Competition",
      "content" : "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    },
    {
      "title" : "Class Decoration",
      "content" : "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    }
  ];

  Widget _buildingActivityItems(
      {required Map<String,String> item ,required int index}) {
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
                "${item["title"]}",
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                "20 Sept 2022",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "${item["content"]}",
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 12,
          ),
          item["venue"] != null
              ? Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Venue: ",
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                        Text(
                          "${item["venue"]}",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    )
                  ],
                )
              : Container(),
          AppConfig.of(context)!.buildFlavor != "Parent" ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xFF8C4AF2),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  AppConfig.of(context)!.buildFlavor == "Student" ? "Interested" : "Edit Activity",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTapped = true;
                    activityItems.removeAt(index);
                    Timer(const Duration(seconds: 1), () {
                      setState(() {
                        isTapped = false;
                      });
                    });
                  });
                },
                child: Container(
                  height: 40,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: const Color(0xFF8C4AF2)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    AppConfig.of(context)!.buildFlavor == "Student" ? "Not interested" : "Delete",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF8C4AF2),
                    ),
                  ),
                ),
              ),
            ],
          ) : Container()
        ],
      ),
    );
  }
}
