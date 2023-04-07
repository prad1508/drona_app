import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const DatePicker({super.key, required  this.controller, required String this.hintText});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                    controller: widget.controller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.calendar_month,
                        size: 30.0,
                      ),
                      hintText: 'Dob',
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                     onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (date != null) {
                  widget.controller.text = DateFormat('dd/MM/yyyy').format(date);
                }
              },
                  );
  }
}