import 'package:flutter/material.dart';

class CircleWidthtext extends StatefulWidget {
  final num numb; final String label; final Color color; 
  const CircleWidthtext({super.key, required this.color, required this.label, required this.numb});

  @override
  State<CircleWidthtext> createState() => _CircleWidthtextState();
}

class _CircleWidthtextState extends State<CircleWidthtext> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
                Row(
                  children:  [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: widget.color,
                      child: Text(
                        widget.numb.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 48, 10, 135),
                            fontSize: 17,
                            fontFamily: 'Loto-Regular',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Text(
                        widget.label,
                        style: TextStyle(
                            color: widget.color,
                            fontSize: 17,
                            fontFamily: 'poppin',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
      ],
    );
  
  }
}

