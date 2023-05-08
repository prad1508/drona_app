// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    int valueTrainee = 1;
    int valueOnboard = 2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          //width: MediaQuery.of(context).size.width * 0.10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: 1,
                groupValue: valueTrainee,
                onChanged: (value) {
                  setState(() {
                    valueTrainee = value!;
                  });
                },
              ),
              SizedBox(width: 5),
              Text(
                "Active",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff39404A)),
              ),
              SizedBox(width: 18),
              Radio(
                value: 2,
                groupValue: valueTrainee,
                onChanged: (value) {
                  setState(() {
                    valueTrainee = value!;
                  });
                },
              ),
              SizedBox(width: 5),
              Text(
                "Inactive",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff39404A)),
              ),
              SizedBox(width: 18),
              Radio(
                value: 3,
                groupValue: valueTrainee,
                onChanged: (value) {
                  setState(() {
                    valueTrainee = value!;
                  });
                },
              ),
              SizedBox(width: 5),
              Text(
                "Unassigned",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff39404A)),
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        Text(
          "Onbording Status",
          style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff39404A)),
        ),
        SizedBox(width: 10),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: valueOnboard,
              onChanged: (value) {
                setState(() {
                  valueOnboard = value!;
                });
              },
            ),
            SizedBox(width: 5),
            Text(
              "Onboarded",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff39404A)),
            ),
            SizedBox(width: 18),
            Radio(
              value: 2,
              groupValue: valueOnboard,
              onChanged: (value) {
                setState(() {
                  valueOnboard = value!;
                });
              },
            ),
            SizedBox(width: 5),
            Text(
              "Not Onboarded",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff39404A)),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color(0xffDFE1E4),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 165,
                height: 48,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffDFE1E4)),
                    onPressed: () {},
                    child: Text(
                      "Clear All",
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff39404A)),
                    ))),
            SizedBox(width: 12),
            Container(
              width: 165,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2A62B8)),
                onPressed: () {},
                child: Text(
                  "Apply",
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFBFBFC)),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
