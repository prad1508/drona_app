import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 1000,
      child: Image.asset(
        "assets/images/nodata.png",
        fit: BoxFit.fitWidth,
        height: 300,
      ),
    );
  }
}
