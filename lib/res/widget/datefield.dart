import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class DateOfBirth extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const DateOfBirth({super.key, required  this.controller, required String this.hintText});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                    readOnly: true,
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
                     var lastDate = DateFormat('yyyy').format(DateTime.now().subtract(Duration(days: 6574,)));
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1990),
                    firstDate: DateTime(1930),
                    lastDate: DateTime(int.parse(lastDate)));
                if (date != null) {
                  widget.controller.text = DateFormat('dd/MM/yyyy').format(date);
                }
              },
                  );
  }
}

class DateOfjoining extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const DateOfjoining({super.key, required  this.controller, required String this.hintText});

  @override
  State<DateOfjoining> createState() => _DateOfjoiningState();
}

class _DateOfjoiningState extends State<DateOfjoining> {
    @override
  Widget build(BuildContext context) {
    return TextFormField(
                    readOnly: true,
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
                    initialDate:DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime.now());
                if (date != null) {
                  widget.controller.text = DateFormat('dd/MM/yyyy').format(date);
                }
              },
                  );
  }
}
