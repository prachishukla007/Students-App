import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/widgets/big_white_container.dart';

import '../enums/attendance_type.dart';

class TeachersAttendanceScreen extends StatefulWidget {
  const TeachersAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<TeachersAttendanceScreen> createState() => _TeachersAttendanceScreenState();
}

class _TeachersAttendanceScreenState extends State<TeachersAttendanceScreen> {
  var itemData;
  AttendanceType attendanceType = AttendanceType.present;
  String dropDownValue = 'Class 5th';
  final List<String> getList = [
    'Class 5th',
    'Class 6th',
    'Class 7th',
    'Class 8th',
    'Class 9th',
    'Class 10th',
    'Class 11th',
    'Class 12th'
  ];

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
                  child: Column(children: [
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
                                child:
                                    SvgPicture.asset("assets/icons/Vector.svg"),
                              )),
                          const Text(
                            "Attendance",
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
                                left: 15, top: 5, bottom: 5, right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dropDownValue,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                DropdownButton<String>(
                                  underline: Container(),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                  ),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 15),
                                  onChanged: (String? value) {
                                    print("Value: $value");
                                    setState(() {
                                      dropDownValue = value!;
                                    });
                                  },
                                  items: getList.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: attendanceList.length,
                                  itemBuilder: (context, index) {
                                    return _buildingAttendanceItem(
                                        item: attendanceList[index],
                                        index: index);
                                  }))
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            )),
      ),
    );
  }

  List<AttendanceItems> attendanceList = [
    AttendanceItems(image: "assets/images/abhinav.png", name: "Sahil Sharma"),
    AttendanceItems(image: "assets/images/abhishek.png", name: "Jatin Mehta"),
    AttendanceItems(image: "assets/images/jayneel.png", name: "Rahul"),
    AttendanceItems(image: "assets/images/rahul.png", name: "John Doe"),
    AttendanceItems(image: "assets/images/sahil.png", name: "Nikhil"),
    AttendanceItems(image: "assets/images/sourav.png", name: "Ajay"),
    AttendanceItems(image: "assets/images/udit.png", name: "Manish"),
    AttendanceItems(image: "assets/images/vinit.png", name: "Aradhya Diwakar"),
    AttendanceItems(image: "assets/images/abhinav.png", name: "Vinit Tanwar"),
    AttendanceItems(image: "assets/images/rahul.png", name: "Vani Sharma"),
  ];

  Widget _buildingAttendanceItem(
      {required AttendanceItems item, required int index}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                item.image,
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(item.name)
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    itemData = item;
                    attendanceType = AttendanceType.present;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: attendanceType == AttendanceType.present
                          ? const Color(0xFF8C4AF2)
                          : Colors.grey.shade300),
                  child: Text(
                    "Present",
                    style: TextStyle(
                      color: attendanceType == AttendanceType.present ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    itemData = item;
                    attendanceType = AttendanceType.absent;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: itemData == item && attendanceType == AttendanceType.absent
                          ? const Color(0xFF8C4AF2)
                          : Colors.grey.shade300),
                  child: Text(
                    "Absent",
                    style: TextStyle(
                      color: attendanceType == AttendanceType.absent ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AttendanceItems {
  final String image;
  final String name;

  AttendanceItems({required this.image, required this.name});
}
