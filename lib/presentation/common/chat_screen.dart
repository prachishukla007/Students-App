import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resource/enums/chat_type.dart';
import '../widgets/big_white_container.dart';
import '../widgets/custom_radio_button.dart';
import 'messages_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var chatType = ChatType.teachers;
  List teacherChatList = [
    ChatItem(
        image: Image.asset("assets/images/scienceT.png"),
        title: "Science Teacher",
        subtitle: "Yes, It's nice!",
        time: "10:00 am",
        name: "Siddharth Rao",
        messages: 1),
    ChatItem(
        image: Image.asset("assets/images/musicT.png"),
        title: "Music Teacher",
        name: "Gaurav Dey",
        subtitle: "Hey! What's up.",
        time: "Yesterday",
        messages: 2),
    ChatItem(
        image: Image.asset("assets/images/biologyT.png"),
        title: "Biology Teacher",
        name: "Sourav Abc",
        subtitle: "Some dummy text",
        time: "Yesterday",
        tick: SvgPicture.asset("assets/icons/tick.svg", color: Colors.blue)),
    ChatItem(
        image: Image.asset("assets/images/engT.png"),
        title: "English Teacher",
        name: "Sonali XYZ",
        subtitle: "I'll share in few minutes.",
        time: "10/10/1010",
        tick: SvgPicture.asset("assets/icons/tick.svg")),
    ChatItem(
        image: Image.asset("assets/images/musicT.png"),
        title: "History Teacher",
        name: "Rashmi",
        subtitle: "Yes, It's nice!",
        time: "09/10/1010",
        tick: SvgPicture.asset("assets/icons/tick.svg")),
    ChatItem(
        image: Image.asset("assets/images/engT.png"),
        title: "English Teacher",
        name: "Paras",
        subtitle: "Hey! What's up.",
        time: "08/10/1010",
        tick: SvgPicture.asset("assets/icons/tick.svg")),
    ChatItem(
        image: Image.asset("assets/images/engT.png"),
        title: "English Teacher",
        name: "Mahira Sharma",
        subtitle: "Wow, It's great!",
        time: "04/10/1010",
        tick: SvgPicture.asset("assets/icons/tick.svg")),
    ChatItem(
        image: Image.asset("assets/images/engT.png"),
        title: "English Teacher",
        name: "Shehbaaz",
        subtitle: "I'll share in few minutes.",
        time: "01/10/1010",
        messages: 1),
  ];
  List classmateChatList = [
    ChatItem(
        image: Image.asset("assets/images/rahul.png"),
        title: "Classmate",
        subtitle: "Hey!",
        name: "Rahul",
        time: "10:00 am",
        messages: 1),
    ChatItem(
        image: Image.asset("assets/images/musicT.png"),
        title: "Classmate",
        name: "Sahil Sharma",
        subtitle: "Can you show the notes please?",
        time: "Yesterday",
        messages: 2),
    ChatItem(
        image: Image.asset("assets/images/biologyT.png"),
        title: "Classmate",
        name: "Udit Thapa",
        subtitle: "Last class timing is 5:00 pm",
        time: "Yesterday",
        tick: SvgPicture.asset("assets/icons/tick.svg", color: Colors.blue)),
    ChatItem(
        image: Image.asset("assets/images/engT.png"),
        title: "Classmate",
        name: "Abishek Gupta",
        subtitle: "I'll share in few minutes.",
        time: "10/10/1010",
        tick: SvgPicture.asset("assets/icons/tick.svg")),
    ChatItem(
        image: Image.asset("assets/images/musicT.png"),
        title: "Classmate",
        name: "Vinit",
        subtitle: "Yes, It's nice!",
        time: "09/10/1010",
        tick: SvgPicture.asset("assets/icons/tick.svg")),
    ChatItem(
        image: Image.asset("assets/images/engT.png"),
        title: "Classmate",
        name: "Sourav",
        subtitle: "Hey! What's up.",
        time: "08/10/1010",
        tick: SvgPicture.asset("assets/icons/tick.svg")),
    ChatItem(
        image: Image.asset("assets/images/engT.png"),
        title: "Classmate",
        name: "Jayneel",
        subtitle: "Wow, It's great!",
        time: "04/10/1010",
        tick: SvgPicture.asset("assets/icons/tick.svg")),
    ChatItem(
        image: Image.asset("assets/images/engT.png"),
        name: "Abhinav",
        title: "Classmate",
        subtitle: "Good job!",
        time: "01/10/1010",
        messages: 1),
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
                                    child: SvgPicture.asset(
                                        "assets/icons/Vector.svg"))),
                            Text(
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
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Flexible(
                                  child: CustomRadioButton<ChatType>(
                                      value: ChatType.teachers,
                                      groupValue: chatType,
                                      onChanges: (value) {
                                        setState(() {
                                          chatType = value!;
                                        });
                                      },
                                      title: "Class teachers"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: CustomRadioButton<ChatType>(
                                      value: ChatType.classmates,
                                      groupValue: chatType,
                                      onChanges: (value) {
                                        setState(() {
                                          chatType = value!;
                                        });
                                      },
                                      title: "Classmates"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          chatType == ChatType.teachers
                              ? Expanded(
                                  child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: teacherChatList.length,
                                  itemBuilder: (context, index) {
                                    // if (index == teacherChatList.length) {
                                    //   return SizedBox(height: 100);
                                    // }
                                    return _buildingChatItem(
                                        chatItem: teacherChatList[index]);
                                  },
                                ))
                              : Expanded(
                                  child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: classmateChatList.length,
                                  itemBuilder: (context, index) {
                                    // if (index == classmateChatList.length) {
                                    //   return SizedBox(height: 100);
                                    // }
                                    return _buildingChatItem(
                                        chatItem: classmateChatList[index]);
                                  },
                                )),
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }

  Widget _buildingChatItem({required ChatItem chatItem}) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessagesScreen(
                          chatItem: chatItem,
                        )));
          },
          title: Text(
            chatType == ChatType.teachers ? chatItem.title : chatItem.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(chatItem.subtitle),
          contentPadding: EdgeInsets.zero,
          leading: chatItem.image,
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        chatItem.messages != null ? Color(0xFF0182FC) : null),
                child: chatItem.messages != null
                    ? Center(
                        child: Text(
                        "${chatItem.messages}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ))
                    : chatItem.tick,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                chatItem.time,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        Divider(),
        // Container(
        //   height: 5,
        // )
      ],
    );
  }
}

class ChatItem {
  final Image image;
  final String title;
  final String subtitle;
  final int? messages;
  final SvgPicture? tick;
  final String time;
  final String name;

  ChatItem(
      {required this.image,
      required this.name,
      required this.title,
      required this.subtitle,
      this.tick,
      this.messages,
      required this.time});
}
