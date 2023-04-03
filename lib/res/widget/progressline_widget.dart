
import 'package:flutter/material.dart';


class ProgressLineWidget extends StatefulWidget {
 final String title;
 final dynamic value, total;
 final Color progcolor;
  const ProgressLineWidget({super.key, required this.title, required this.value, required this.total, required this.progcolor});

  @override
  State<ProgressLineWidget> createState() => _ProgressLineWidgetState();
}

class _ProgressLineWidgetState extends State<ProgressLineWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
            RichText(
              text: TextSpan(
                style: const TextStyle(height: 2),
                children: <TextSpan>[
                  TextSpan(text: widget.value.toString(), style: Theme.of(context).textTheme.bodyMedium,),
                  TextSpan(text: '/${widget.total}', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            )
          ],
          ),
          LinearProgressIndicator(
            color: widget.progcolor,
                                  backgroundColor: const Color.fromARGB(255, 176, 175, 174),
                                  minHeight: 10,
                                  value:  widget.value / widget.total,
                                  semanticsLabel: 'Linear progress indicator',
                                ),
      ], 
    );
  }
}