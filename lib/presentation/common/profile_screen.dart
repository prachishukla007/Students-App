import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/big_white_container.dart';
import '../widgets/border_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? phone;
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    getPhoneNumber();
    super.initState();
  }

  Future getPhoneNumber() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var phoneNo = sharedPreferences.getString("phoneNumber");
    setState(() {
      phone = phoneNo;
    });
  }

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
                          EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                          const Text(
                            "Profile",
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: SvgPicture.asset(
                              "assets/icons/add_stu.svg",
                              height: 60,
                              width: 60,
                            ),
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              "Rohan Mehta",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              phone ?? "",
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 13),
                            ),
                          ),
                        ),
                        _listTile(
                            icon: SvgPicture.asset("assets/icons/language.svg"),
                            title: "Language",
                            subtitle: "English"),
                        _listTile(
                            icon: SvgPicture.asset(
                                "assets/icons/notification.svg"),
                            title: "Notification",
                            subtitle:
                                "Recommendations and Special communications"),
                        _listTile(
                            icon: SvgPicture.asset("assets/icons/help.svg"),
                            title: "Help Center",
                            subtitle: "See FAQ & Contact support"),
                        _listTile(
                            icon: SvgPicture.asset("assets/icons/rate-us.svg"),
                            title: "Rate us",
                            subtitle: "Please take a moment to rate us"),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            color: Colors.white,
            child: GestureDetector(
                onTap: () {
                  _dialogBuilder(context: context);
                },
                child: const BorderBox(
                  margin: false,
                  color: Color(0xFF8C4AF2),
                  height: 50,
                  child: Text(
                    "Log out",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder({required BuildContext context}) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to logout?'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: BorderBox(
                        child: Text("Cancel"),
                        color: Colors.white,
                        margin: false),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    child: const BorderBox(
                      color: Color(0xFF8C4AF2),
                      margin: false,
                      height: 40,
                      width: 100,
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () async {
                      Navigator.pop(context);
                      await _signOut(context: context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Logged out")));
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                    },
                  )
                ],
              )
            ],
          );
        });
  }

  Future<void> _signOut({required BuildContext context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      var snackBar = SnackBar(content: Text("Something went wrong: $e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _listTile(
      {required SvgPicture icon,
      required String title,
      required String subtitle}) {
    return ListTile(
      leading: Column(
        children: [
          SizedBox(
            height: 13,
          ),
          icon
        ],
      ),
      minLeadingWidth: 30,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 13)),
      contentPadding: EdgeInsets.zero,
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}
