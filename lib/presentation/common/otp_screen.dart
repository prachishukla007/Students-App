import 'dart:async';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/border_box.dart';
import '../widgets/white_container.dart';
import 'enter_student_id_screen.dart';
import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  static String verify = "";

  const OtpScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";
  String otp = "";
  bool isLoaded = false;
  int start = 59;
  Color resendColor = Color(0xFF757575);
  bool resendTapped = false;

  var _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const onSec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onSec, (timer) {
      if (start == 0) {
        timer.cancel;
        setState(() {
          resendColor = const Color(0xFF8C4AF2);
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/enter_otp_girl.svg';
    return ColorfulSafeArea(
        color: const Color(0xFF8C4AF2),
        child: SafeArea(
            child: Scaffold(
          backgroundColor: isLoaded ? Colors.white : const Color(0xFF8C4AF2),
          body: isLoaded
              ? Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 50),
                            child: SvgPicture.asset(
                              assetName,
                              placeholderBuilder: (context) {
                                return Container(
                                  height: 220,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          WhiteContainer(
                            headerText: "Enter OTP",
                            labelText:
                                "OTP has been successfully sent to your \n ${widget.phone}",
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Form(
                                key: _formKey,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: 6,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return BorderBox(
                                                width: 55,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 21),
                                                margin: true,
                                                color: Colors.grey.shade200,
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  initialValue: null,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  autofocus: true,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        1),
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "?";
                                                    }
                                                  },
                                                  // maxLength: 1,
                                                  onChanged: (value) {
                                                    if (value.length == 1) {
                                                      if (index < 5) {
                                                        FocusScope.of(context)
                                                            .nextFocus();
                                                      } else {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                      }
                                                    }
                                                    if (value.isEmpty) {
                                                      if (index > 0) {
                                                        FocusScope.of(context)
                                                            .previousFocus();
                                                        return;
                                                      }
                                                    }
                                                    otp += value;
                                                    if (index == 5) {
                                                      otpCode = otp;
                                                      otp = "";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  // textInputAction: TextInputAction.next,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "0",
                                                      hintStyle: TextStyle(
                                                          color: Colors
                                                              .grey.shade400)),
                                                ));
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          bottomNavigationBar: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    print(otpCode);
                    setState(() {
                      isLoaded = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: resendTapped ? OtpScreen.verify : LoginScreen.verify,
                                smsCode: otpCode);
                        await auth.signInWithCredential(credential);
                        setState(() {
                          isLoaded = false;
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const StudentIDScreen()));
                      } catch (e) {
                        setState(() {
                          isLoaded = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Wrong OTP! Please enter again")));
                        print("Wrong OTP");
                      }
                    }
                  },
                  child: const BorderBox(
                    margin: false,
                    color: Color(0xFF8C4AF2),
                    height: 50,
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("00:$start  ",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          resendTapped = true;
                          resendColor = Color(0xFF757575);
                        });
                        if (start == 0) {
                          try {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '+91${widget.phone}',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {
                                print("Phone credentials $credential");
                              },
                              verificationFailed: (FirebaseAuthException e) {
                                print("Verification failed $e");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Verification Failed! Try after some time.")));
                              },
                              codeSent: (String verificationId,
                                  int? resendToken) async {
                                OtpScreen.verify = verificationId;
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          } catch (e) {
                            print("Exception $e");
                          }
                        }
                        setState(() {
                          start = 59;
                          startTimer();
                        });
                      },
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 16,
                            color: resendColor,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
