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
        const Text(
          "Trainee Status",
          style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff39404A)),
        ),
        const SizedBox(width: 5),
        Row(
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
            const SizedBox(width: 5),
            const Text(
              "Active",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff39404A)),
            ),
            const SizedBox(width: 5),
            Radio(
              value: 2,
              groupValue: valueTrainee,
              onChanged: (value) {
                setState(() {
                  valueTrainee = value!;
                });
              },
            ),
            const SizedBox(width: 5),
            const Text(
              "Inactive",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff39404A)),
            ),
            const SizedBox(width: 5),
            Radio(
              value: 3,
              groupValue: valueTrainee,
              onChanged: (value) {
                setState(() {
                  valueTrainee = value!;
                });
              },
            ),
            const SizedBox(width: 5),
            const Text(
              "Unassigned",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff39404A)),
            ),
          ],
        ),
        const SizedBox(width: 5),
        const Text(
          "Onbording Status",
          style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff39404A)),
        ),
        const SizedBox(width: 5),
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
            const SizedBox(width: 5),
            const Text(
              "Onboarded",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff39404A)),
            ),
            const SizedBox(width: 18),
            Radio(
              value: 2,
              groupValue: valueOnboard,
              onChanged: (value) {
                setState(() {
                  valueOnboard = value!;
                });
              },
            ),
            const SizedBox(width: 5),
            const Text(
              "Not Onboarded",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff39404A)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: Color(0xffDFE1E4),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 165,
                height: 48,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffDFE1E4)),
                    onPressed: () {},
                    child: const Text(
                      "Clear All",
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff39404A)),
                    ))),
            const SizedBox(width: 20),
            Container(
              width: 165,
              height: 48,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2A62B8)),
                onPressed: () {},
                child: const Text(
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
