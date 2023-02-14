
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String hint;
  const PasswordField(
      {Key? key,
      required this.controller,
      required this.type,
      required this.hint})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;
  toggle() {
    setState(() {
      isObscure = !isObscure;
    });
    return isObscure;
  }

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
        obscureText: isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.hint,
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              toggle();
            },
          ),
        ),
      ),
    );
  }
}
