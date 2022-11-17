import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanges;
  final String title;

  const CustomRadioButton(
      {required this.value, required this.groupValue, required this.onChanges, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () {
        onChanges.call(value);
      },
      child: Container(
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF8C4AF2) : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
          // border: Border.all(
          //   color: isSelected ? Color(0xFF8C4AF2) : Colors.white,
          //   width: 2,
          // ),
        ),
        child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black,
                  // letterSpacing: 0.5
                ),
              ),

      ),
    );
  }
}
