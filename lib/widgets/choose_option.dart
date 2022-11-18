import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseOption extends StatelessWidget {
  final String text;

  const ChooseOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF9a5df9),
        borderRadius: BorderRadius.circular(7),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      margin: const EdgeInsets.only(right: 15),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,

        ),
      ),
    );
  }
}
