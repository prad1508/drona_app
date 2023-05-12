// ignore_for_file: prefer_const_constructors

import 'package:drona/view/coach_listing/coach_access_management.dart';
import 'package:drona/view/coach_listing/coach_activate.dart';
import 'package:drona/view/coach_listing/coach_deactivate.dart';
import 'package:drona/view/coach_listing/coach_view_profile.dart';
import 'package:flutter/material.dart';

class CoachOption_Button extends StatelessWidget {
  const CoachOption_Button({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            title: Text(
              "View Profile",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff39404A)),
            ),
            contentPadding: EdgeInsets.all(2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const View_Profile()),
              );
            },
          ),
          ListTile(
            title: Text(
              "Deactivate",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff39404A)),
            ),
            contentPadding: EdgeInsets.all(2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CoachDeactivate_Page()),
              );
            },
          ),
          ListTile(
            title: Text(
              "Activate",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff39404A)),
            ),
            contentPadding: EdgeInsets.all(2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CoachActivate_Page()),
              );
            },
          ),
          ListTile(
            title: Text(
              "Access Management",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff39404A)),
            ),
            contentPadding: EdgeInsets.all(2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Access_Management_Page()),
              );
            },
          ),
        ],
      ),
    );
  }
}
