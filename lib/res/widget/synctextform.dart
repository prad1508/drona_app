import 'dart:async';

import 'package:flutter/material.dart';

class AsyncTextFormField extends StatefulWidget {
  final Future<bool> Function(String) validator;
  final Duration validationDebounce;
  final TextEditingController controller;
  final String hintText;
  final String isValidatingMessage;
  final String valueIsEmptyMessage;
  final String valueIsInvalidMessage;
  final dynamic keyboardType;
  final bool enable;
  const AsyncTextFormField(
      {Key? key,
      required this.validator,
      required this.validationDebounce,
      required this.controller,
      this.isValidatingMessage = "please wait for the validation to complete",
      this.valueIsEmptyMessage = 'please enter a value',
      this.valueIsInvalidMessage = 'please enter a valid value',
      this.hintText = '',  
      this.enable = true,
      this.keyboardType = TextInputType.name})
      : super(key: key);

  @override
  _AsyncTextFormFieldState createState() => _AsyncTextFormFieldState();
}

class _AsyncTextFormFieldState extends State<AsyncTextFormField> {
  Timer? _debounce;
  var isValidating = false;
  var isValid = false;
  var isDirty = false;
  var isWaiting = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (isValidating) {
          return widget.isValidatingMessage;
        }
        if (value?.isEmpty ?? false) {
          return widget.valueIsEmptyMessage;
        }
        if (!isWaiting && !isValid) {
          return widget.valueIsInvalidMessage;
        }
        return null;
      },
      onChanged: (text) async {
        isDirty = true;
        if (text.isEmpty) {
          setState(() {
            isValid = false;
            print('is empty');
          });
          cancelTimer();
          return;
        }
        isWaiting = true;
        cancelTimer();
        _debounce = Timer(widget.validationDebounce, () async {
          isWaiting = false;
          isValid = await validate(text);
          print(isValid);
          setState(() {});
          isValidating = false;
        });
      },
      enabled: widget.enable,
      textAlign: TextAlign.start,
      controller: widget.controller,
      maxLines: 1,
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left:10, right: 10),
          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
        suffix: SizedBox(height: 20, width: 20, child: _getSuffixIcon()), hintText: widget.hintText),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void cancelTimer() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
  }

  Future<bool> validate(String text) async {
    setState(() {
      isValidating = true;
    });
    final isValid = await widget.validator(text);
    isValidating = false;
    return isValid;
  }

  Widget _getSuffixIcon() {
    if (isValidating) {
      return CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      );
    } else {
      if (!isValid && isDirty) {
        return Icon(
          Icons.cancel,
          color: Colors.red,
          size: 20,
        );
      } else if (isValid) {
        return Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20,
        );
      } else {
        return Container();
      }
    }
  }
}