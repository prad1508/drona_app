import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String title ;
  final bool loading ;
  final VoidCallback onPress ;
  final bool rounded;
  final Color color;
  final Color textColor;
  const RoundButton({Key? key ,
    required this.title,
    this.loading = false ,
     required this.onPress,
     required this.rounded,
     required this.color,
     required this.textColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(rounded == true ? 5 : 80)
        ),
        child: Center(
            child:loading ? const CircularProgressIndicator(color: Colors.white,) :  Text(title ,
              style: TextStyle(color: textColor, fontSize: 15, fontFamily: 'Loto-Regular', fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
