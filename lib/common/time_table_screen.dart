import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/big_white_container.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({Key? key}) : super(key: key);

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  List<Map<String, dynamic>> list = [
    {"title": "History", "fromTime": "08:00", "toTime": "08:40"},
    {"title": "Biology", "fromTime": "08:40", "toTime": "09:20"},
    {"title": "Mathematics", "fromTime": "09:20", "toTime": "10:00"},
    {"title": "English", "fromTime": "10:00", "toTime": "10:40"},
    {"title": "Social Science", "fromTime": "09:20", "toTime": "10:00"},
    {"title": "Geography", "fromTime": "10:00", "toTime": "10:40"},
    {"title": "Social Science", "fromTime": "09:20", "toTime": "10:00"},
    {"title": "Science", "fromTime": "10:00", "toTime": "10:40"}
  ];

  var itemData;

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
                            "Time Table",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
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
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                // if (index == list.length) {
                                //   return SizedBox(
                                //     height: 100,
                                //   );
                                // }
                                return _buildingTimeTableItems(
                                    item: list[index]);
                              }),
                        ),
                      ],
                    )),
                  ],
                )),
          ],
        ),
      )),
    );
  }

  Widget _buildingTimeTableItems({required Map<String, dynamic> item}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          itemData = item;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                color: itemData == item
                    ? const Color(0xFF8C4AF2)
                    : Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "${item["fromTime"]} am - ${item["toTime"]} am",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 17),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
