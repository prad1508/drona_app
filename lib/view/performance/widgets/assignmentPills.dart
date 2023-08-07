import 'package:drona/utils/color.dart' as AppColor;

import 'package:flutter/material.dart';

class AssignmentPills extends StatefulWidget {
  final num number;
  final num active;
  final Color color;
  const AssignmentPills(
      {required this.number,
        required this.active,
        required this.color,
        super.key});

  @override
  State<AssignmentPills> createState() => _AssignmentPillsState();
}

class _AssignmentPillsState extends State<AssignmentPills> {
  _pills(i, active) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
              height: 8,
              width: MediaQuery.of(context).size.width * 0.81 / widget.number,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: i <= active
                    ? AppColor.secondryColor
                    : Theme.of(context).secondaryHeaderColor,
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      for (int i = 0; i < widget.number; i++) _pills(i, widget.active)
    ]);
  }
}
