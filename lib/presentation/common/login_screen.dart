import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/border_box.dart';
import '../widgets/white_container.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static String verify = "";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  var _phoneController = TextEditingController();
  var _countryCodeController = TextEditingController();
  Color focusBorderColor = Colors.black12;
  Color underlineColor = Colors.grey.shade200;
  RegExp regExp = RegExp(r'^[0]?[6789]\d{9}$');
  RegExp countryRegExp = RegExp(r'^\+?(\d+)');
  bool divider = false;
  bool isLoaded = false;

  int validatePhone(String phone) {
    String pattern = r'^[0]?[6789]\d{9}$';
    RegExp regExp = RegExp(pattern);
    if (phone.isEmpty) {
      return 1;
    } else if (phone.length < 10) {
      return 2;
    } else if (!regExp.hasMatch(phone)) {
      return 3;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    const String assetName = "assets/images/login_girl.svg";
    return ColorfulSafeArea(
        color: const Color(0xFF8C4AF2),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: isLoaded? Colors.white :const Color(0xFF8C4AF2),
            body: isLoaded? Center(child: CircularProgressIndicator()) : CustomScrollView(
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
                          headerText: "Login",
                          labelText:
                              "Please enter your 10 digit phone no to proceed",
                          child: BorderBox(
                              margin: false,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              color: Colors.grey.shade200,
                              height: 60,
                              child: Form(
                                key: _formKey,
                                child: Row(
                                  children: [
                                    BorderBox(
                                        height: 100,
                                        width: 55,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 8),
                                        color: Colors.grey.shade200,
                                        margin: false,
                                        child: TextFormField(
                                          controller: _countryCodeController,
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            if (!countryRegExp
                                                .hasMatch(value)) {
                                              setState(() {
                                                focusBorderColor =
                                                    Colors.red.shade900;
                                                underlineColor =
                                                    focusBorderColor;
                                              });
                                            } else {
                                              setState(() {
                                                focusBorderColor =
                                                    Colors.green.shade700;
                                                underlineColor =
                                                    focusBorderColor;
                                              });
                                            }
                                            if (value.length == 4) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Code?";
                                            } else if (!countryRegExp
                                                .hasMatch(value)) {
                                              return "Invalid";
                                            }
                                          },
                                          style: TextStyle(fontSize: 19),
                                          keyboardType: TextInputType.phone,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(4)
                                          ],
                                          decoration: InputDecoration(
                                            hintText: "+91",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade400),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: underlineColor),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: focusBorderColor),
                                            ),
                                          ),
                                        )),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0),
                                      child: VerticalDivider(
                                        thickness: 2,
                                      ),
                                    ),
                                    BorderBox(
                                        height: 100,
                                        width: 250,
                                        color: Colors.grey.shade200,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 8),
                                        margin: false,
                                        child: TextFormField(
                                          controller: _phoneController,
                                          validator: (value) {
                                            int res = validatePhone(value!);
                                            if (res == 1) {
                                              return "Please enter number";
                                            } else if (res == 2) {
                                              return "Please enter 10 digits phone number";
                                            } else if (res == 3) {
                                              return "Please enter a valid 10 digits phone number";
                                            } else {
                                              return null;
                                            }
                                          },
                                          style: const TextStyle(fontSize: 19),
                                          keyboardType: TextInputType.phone,
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              FocusScope.of(context)
                                                  .previousFocus();
                                            } else if (value.length == 10) {
                                              FocusScope.of(context).unfocus();
                                            }
                                          },
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                10),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "XXXXXXXXXX",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey.shade400)),
                                        )),
                                  ],
                                ),
                              ))),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: Colors.white,
              child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoaded = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                          '${_countryCodeController.text + _phoneController.text}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {
                            print("Phone credentials $credential");
                              },
                          verificationFailed: (FirebaseAuthException e) {
                            setState(() {
                              isLoaded = false;
                            });
                            print("Verification failed $e");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification Failed! Try after some time.")));
                          },
                          codeSent:
                              (String verificationId, int? resendToken) async {
                            LoginScreen.verify = verificationId;
                            await savePhone();
                            setState(() {
                              isLoaded = false;
                            });
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }
                      catch(e) {
                        print("Exception $e");
                      }
                    }
                  },
                  child: const BorderBox(
                    margin: false,
                    color: Color(0xFF8C4AF2),
                    height: 50,
                    child: Text(
                      "Proceed",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
            ),
          ),
        ));
  }

  savePhone() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences
        .setString("phoneNumber", _phoneController.text)
        .whenComplete(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => OtpScreen(phone: _phoneController.text)));
    });
  }
}
