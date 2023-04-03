import 'package:flutter/material.dart';
import '../../utils/color.dart' as appcolor;

class ProgressPills extends StatefulWidget {
  final num number;
  final num active;
  final Color color;
  const ProgressPills({required this.number,
      required this.active,
      required this.color, super.key});

  @override
  State<ProgressPills> createState() => _ProgressPillsState();
}

class _ProgressPillsState extends State<ProgressPills> {
  _pills(i, active) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
              height: 6,
              width: MediaQuery.of(context).size.width * 0.6 / widget.number,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: i <= active
                    ? appcolor.secondryColor
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
