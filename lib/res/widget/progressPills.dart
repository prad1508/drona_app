import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../utils/color.dart' as AppColor;

class progressPills extends StatefulWidget {
  final num number;
  final num active;
  final Color color;
  const progressPills(
      {required this.number,
      required this.active,
      required this.color,
      super.key});

  @override
  State<progressPills> createState() => _progressPillsState();
}

class _progressPillsState extends State<progressPills> {
  _pills(i, active) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
              height: 6,
              width: MediaQuery.of(context).size.width * 0.6 / widget.number,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
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
    return Row(children: [
      for (int i = 0; i < widget.number; i++) _pills(i, widget.active)
    ]);
  }
}
