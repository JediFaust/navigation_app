import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  //final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final Function callback;

  const CustomButton(
      {Key? key,
      required this.text,
      //this.backgroundColor = Colors.black,
      this.textColor = Colors.grey,
      this.textSize = 24,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        callback(text);
      },
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: textSize),
      ),
    );
  }
}
