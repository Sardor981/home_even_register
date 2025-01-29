import 'package:flutter/material.dart';

class textControllerWidget extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String hintText;
  final Icon icon;

  textControllerWidget(
      {required TextEditingController controller,
      required this.hintText,
      required this.icon})
      : _textEditingController = controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(padding: const EdgeInsets.all(5.0), child: icon),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromARGB(255, 18, 18, 18)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromARGB(255, 36, 29, 240)),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
