import 'dart:ffi';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_ui/common/chat_screen.dart';
import 'package:student_ui/widgets/message_list.dart';

import '../widgets/big_white_container.dart';

class MessagesScreen extends StatefulWidget {
  final ChatItem chatItem;

  const MessagesScreen({Key? key, required this.chatItem}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  var _textController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> list = MessageList;

  @override
  Widget build(BuildContext context) {
    print(MessageList);
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
                            "Chat",
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
                        Row(
                          children: [
                            Stack(children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: widget.chatItem.image,
                              ),
                              Positioned(
                                  top: 1,
                                  right: 1,
                                  child: Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                    ),
                                  ))
                            ]),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.chatItem.name,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  widget.chatItem.title,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                controller: _scrollController,
                                physics: BouncingScrollPhysics(),
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                    return _chatItem(list[index]);
                                }),
                        ),
                        _sendMessageArea()
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

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: "Write messages...",

                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.transparent),
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent, curve: Curves.easeOut, duration: const Duration(microseconds: 500),
              );
              Map<String, dynamic> item = {
                "message": "${_textController.text}",
                "isMe": true,
                "time": "Now"
              };
              if (_textController.text.isNotEmpty) {
                setState(() {
                  MessageList.add(item);
                  _textController.clear();
                });
              }

            },
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade100
              ),
              child: SvgPicture.asset("assets/icons/Vector2.svg", height: 20, width: 20,),
            ),
          )
        ],
      ),
    );
  }


  Widget _chatItem(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Container(
        alignment: (item["isMe"] ? Alignment.topRight : Alignment.topLeft),
        child: Column(
          crossAxisAlignment:
              item["isMe"] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                item["isMe"]
                    ? Text(
                        item["time"],
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      )
                    : Container(
                        height: 40,
                        width: 40,
                        child: item["isMe"]
                            ? SvgPicture.asset("assets/icons/add_stu.svg")
                            : widget.chatItem.image,
                      ),
                const SizedBox(
                  width: 10,
                ),
                item["isMe"]
                    ? Container()
                    : Row(
                        children: [
                          Text(
                            widget.chatItem.name,
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                        ],
                      ),
                item["isMe"]
                    ? Container(
                        height: 40,
                        width: 40,
                        child: item["isMe"]
                            ? SvgPicture.asset("assets/icons/add_stu.svg")
                            : widget.chatItem.image,
                      )
                    : Text(
                        item["time"],
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    item["message"],
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                item["isMe"]
                    ? SizedBox(
                        width: 10,
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
