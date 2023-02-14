
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String hint;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.type,
      required this.hint})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        keyboardType: widget.type,
        obscureText: false,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.hint,
        ),
      ),
    );
  }
}
