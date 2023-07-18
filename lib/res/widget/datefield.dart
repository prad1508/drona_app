import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class DateOfBirth extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const DateOfBirth(
      {super.key, required this.controller, required String this.hintText});

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
        var lastDate =
            DateFormat('yyyy').format(DateTime.now().subtract(Duration(
          days: 6574,
        )));
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
  const DateOfjoining(
      {super.key, required this.controller, required String this.hintText});

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
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      onTap: () async {
        DateTime now = DateTime.now();
        DateTime firstDate = DateTime(now.year, now.month);
        var date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: firstDate,
          lastDate: DateTime.now().add(Duration(days: 90)),
        );
        if (date != null) {
          widget.controller.text = DateFormat('dd/MM/yyyy').format(date);
        }
      },
    );
  }
}

class YearMonthPicker extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const YearMonthPicker(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  State<YearMonthPicker> createState() => _YearMonthPickerState();
}

class _YearMonthPickerState extends State<YearMonthPicker> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _showYearMonthPicker(BuildContext context) async {
    final DateTime? picked = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return YearMonthPickerDialog(
          initialDate: _selectedDate,

        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      widget.controller.text = DateFormat('MM-yyyy').format(picked);
    }
  }

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
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      onTap: () {
        _showYearMonthPicker(context);
      },
    );
  }
}

class YearMonthPickerDialog extends StatefulWidget {
  final DateTime initialDate;

  const YearMonthPickerDialog({Key? key, required this.initialDate})
      : super(key: key);

  @override
  _YearMonthPickerDialogState createState() => _YearMonthPickerDialogState();
}

class _YearMonthPickerDialogState extends State<YearMonthPickerDialog> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Year and Month'),
      content: YearMonthPickerWidget(
        initialDate: _selectedDate,
        onChanged: (DateTime date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedDate);
          },
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

class YearMonthPickerWidget extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onChanged;

  const YearMonthPickerWidget({
    Key? key,
    required this.initialDate,
    required this.onChanged,
  }) : super(key: key);

  @override
  _YearMonthPickerWidgetState createState() => _YearMonthPickerWidgetState();
}

class _YearMonthPickerWidgetState extends State<YearMonthPickerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime(
        DateTime.now().year, widget.initialDate.month, widget.initialDate.day);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButton<int>(
                value: _selectedDate.month,
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedDate = DateTime(
                          _selectedDate.year, newValue, _selectedDate.day);
                    });
                    widget.onChanged(_selectedDate);
                  }
                },
                items: List<DropdownMenuItem<int>>.generate(
                  12,
                      (int index) => DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text(DateFormat('MMMM')
                        .format(DateTime(2000, index + 1, 1))),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: DropdownButton<int>(
                value: DateTime.now().year,
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedDate = DateTime(
                          newValue, _selectedDate.month, _selectedDate.day);
                    });
                    widget.onChanged(_selectedDate);
                  }
                },
                items: [
                  DropdownMenuItem<int>(
                    value: DateTime.now().year,
                    child: Text(DateTime.now().year.toString()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

