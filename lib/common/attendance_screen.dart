import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/widgets/border_box.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 7, top: 8,right: 8, bottom: 8),
                            height: 32,
                            width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                            child:  SvgPicture.asset("assets/icons/Vector.svg"),
                          )
                        ),
                        const Text(
                          "Attendance",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Year 2022",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset("assets/icons/calendar.svg")
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20, top: 22),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              SizedBox(width: 10),
                              const Text(
                                "Excellent",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Good",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              SizedBox(width: 10),
                              const Text(
                                "Poor",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemCount: attendanceList.length,
                              itemBuilder: (context,index) {
                              return _buildingAttendanceItem(attendanceList[index]);
                              },
                          ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          ],
          )
        ),
      ),
    );
  }

  Widget _buildingAttendanceItem(Attendance item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.month, style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 5,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)
          ),
          height: 110,
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              item.image,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text("Total Days: ${item.days}",style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  )),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Present: ${item.present}",style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15
                      )),
                      SizedBox(width: 15,),
                      Text("Absent: ${item.absent}",style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15
                      ))
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

List<Attendance> attendanceList = [
  Attendance(image: SvgPicture.asset("assets/icons/87%.svg"), days: 28, present: 24, absent: 04, month: "July,2022"),
  Attendance(image: SvgPicture.asset("assets/icons/90%.svg"), days: 28, present: 26, absent: 02, month: "August,2022"),
  Attendance(image: SvgPicture.asset("assets/icons/75%.svg"), days: 30, present: 26, absent: 02, month: "September,2022"),
  Attendance(image: SvgPicture.asset("assets/icons/10%.svg"), days: 04, present: 04, absent: 0, month: "October,2022"),
];

class Attendance {
  final SvgPicture image;
  final int days;
  final int present;
  final int absent;
  final String month;

  Attendance(
      {required this.image,
      required this.days,
      required this.present,
      required this.absent,
      required this.month});
}
