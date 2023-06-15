import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return  Center(
      child: SizedBox(
        width: w,
        child: Image.asset(
          "assets/images/nodata.png",
          fit: BoxFit.fitWidth,
          height: 300,
        ),
      ),
    );
  }
}
