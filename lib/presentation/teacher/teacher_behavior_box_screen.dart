import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/models/students_list_item.dart';
import '../widgets/big_white_container.dart';
import '../widgets/border_box.dart';


class TeacherBehaviorBoxScreen extends StatefulWidget {
  final StudentsListItem studentsListItem;
  const TeacherBehaviorBoxScreen({Key? key, required this.studentsListItem}) : super(key: key);

  @override
  State<TeacherBehaviorBoxScreen> createState() => _TeacherBehaviorBoxScreenState();
}

class _TeacherBehaviorBoxScreenState extends State<TeacherBehaviorBoxScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
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
                                child:
                                    SvgPicture.asset("assets/icons/Vector.svg"),
                              )),
                          const Text(
                            "Behaviour",
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
                    BigWhiteContainer(child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(widget.studentsListItem.image, height: 50, width: 50),
                            const SizedBox(width: 20),
                            Text(widget.studentsListItem.name, style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Form(
                          key: _formKey,
                          child: Container(
                            height: 250,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade100
                            ),
                            child: TextFormField(
                              controller: _textController,
                              validator: (value) {
                                if(value!.isEmpty) {
                                  return "";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Write from here...",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17
                                )
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.white,
            ),
            child: GestureDetector(
                onTap: ()  {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sent!")));
                    _textController.clear();
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter something first!")));
                  }
                },
                child: const BorderBox(
                  margin: false,
                  color: Color(0xFF8C4AF2),
                  height: 50,
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
