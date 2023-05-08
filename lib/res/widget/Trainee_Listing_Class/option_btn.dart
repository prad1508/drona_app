// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../view/trainee_listing/activate.dart';
import '../../../view/trainee_listing/deactivate.dart';
import '../../../view/trainee_listing/edit_batch.dart';
import '../../../view/trainee_listing/ledger.dart';
import '../../../view/trainee_listing/record_payment.dart';

class Option_Button extends StatelessWidget {
  const Option_Button({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335,
      child: ListView(
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
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Remind For Payment",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff39404A)),
            ),
            contentPadding: EdgeInsets.all(2),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Record A Payment",
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
                MaterialPageRoute(builder: (context) => const Record_Payment()),
              );
            },
          ),
          ListTile(
            title: Text(
              "View Ledger",
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
                MaterialPageRoute(builder: (context) => const Ledger_Page()),
              );
            },
          ),
          ListTile(
            title: Text(
              "Edit Batch",
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
                MaterialPageRoute(builder: (context) => const Edit_Page()),
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
                    builder: (context) => const Deactivate_Page()),
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
                MaterialPageRoute(builder: (context) => const Activate_Page()),
              );
            },
          ),
        ],
      ),
    );
  }
}
