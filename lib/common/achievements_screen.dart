import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/resource/app_config.dart';

import '../widgets/big_white_container.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

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
                            "Achievements",
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
                        Expanded(
                          child: ListView(
                            children: [
                              _buildingAchieveItems(
                                  venue: "Nehru International School",
                                  title: "Essay Writing Competition, Sept 28",
                                  topic: "Pollution Free Country",
                                  context: context,
                                  content:
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                              AppConfig.of(context)!.buildFlavor == "Teacher"
                                  ? Container()
                                  : _buildingAchieveItems(
                                      title: "Chess District Level, Aug 20",
                                      content:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                      venue: "Modern Public School",
                                      context: context),
                              AppConfig.of(context)!.buildFlavor == "Teacher"
                                  ? Container()
                                  : _buildingAchieveItems(
                                      title:
                                          "Essay Writing Competition, Aug 15",
                                      content:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                      venue: "Nehru International School",
                                      topic: "Freedom Fighters",
                                      context: context)
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildingAchieveItems(
      {required String title,
      required String content,
      required String venue,
      String? topic,
      required BuildContext context}) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                  topic != null
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Topic: $topic",
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 13),
                            )
                          ],
                        )
                      : Container()
                ],
              ),
              Image.asset("assets/icons/medal.png"),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(content),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Venue: $venue",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          )
        ]));
  }
}
