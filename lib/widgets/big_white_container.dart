import 'package:flutter/material.dart';

class BigWhiteContainer extends StatelessWidget {
  final Widget child;

  const BigWhiteContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(top: 20,left: 20,right: 20, bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: child),
    );
  }
}
