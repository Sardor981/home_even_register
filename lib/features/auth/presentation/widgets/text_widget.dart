import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final double letterspace;
  final TextAlign textAlign;

  const TextWidget(
      {Key? key,
      required this.text,
      this.size = 16,
      this.color = Colors.black,
      this.letterspace = 2,
      this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style:
          TextStyle(fontSize: size, letterSpacing: letterspace, color: color),
      textAlign: textAlign,
    );
  }
}
