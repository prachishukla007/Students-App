import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/big_white_container.dart';

class ParentBehaviorScreen extends StatelessWidget {
  const ParentBehaviorScreen({Key? key}) : super(key: key);

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
                                            title: "Science Teacher",
                                            subtitle: "Rajat Mehta",
                                            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever",
                                            image:
                                                "assets/images/scienceT.png"),
                                        _buildingTestItems(
                                            title: "Biology Teacher",
                                            subtitle: "Nelaish Mishra",
                                            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever",
                                            image:
                                                "assets/images/biologyT.png"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ))));
  }

  Widget _buildingTestItems(
      {required String title,
      required content,
      required String image,
      required String subtitle}) {
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
            children: [
              Image.asset(image, height: 50, width: 50,),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            content,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 2, right: 5, bottom: 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Write Message here!",
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset("assets/icons/Vector2.svg", height: 20, width: 20,)
              ),
            ],
          )
        ],
      ),
    );
  }
}
