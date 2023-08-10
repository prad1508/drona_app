import 'package:flutter/material.dart';

class Add_Holiday extends StatefulWidget {
  const Add_Holiday({super.key});

  @override
  State<Add_Holiday> createState() => _Add_HolidayState();
}

class _Add_HolidayState extends State<Add_Holiday> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Add Holidays',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontFamily: 'Lato')),

        elevation: 0,
      ),
        body: SafeArea(
        child: Padding(
        padding:
        const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text("Holiday Name",
    style: TextStyle(
    fontSize: 14,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600)),
      const SizedBox(height: 4),
      SizedBox(
        width: w*.9,
        height: 48,
        child: TextFormField(
          style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600),
          decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffDFE1E4),
          ),
          ),
            hintText: "e.g. Founder's Day",
            hintStyle: TextStyle(fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600),
            contentPadding: EdgeInsets.all(10)
          ),
        ),
      ),
      const SizedBox(height: 15),
      const Text("Select Date",
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600)),
      const SizedBox(height: 4),
      SizedBox(
        width: w*.9,
        height: 48,
        child: TextFormField(
          style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Color(0xffDFE1E4),
          ),
          ),
              hintText: "01/12/22",
              hintStyle: const TextStyle(fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600),
              contentPadding: const EdgeInsets.all(10),
            suffixIcon: IconButton(onPressed: () {

            }, icon: const Icon(Icons.calendar_month_outlined,color: Color(0xffC0C4CB),))
          ),
        ),
      ),
      SizedBox(height:h/1.7),
      SizedBox(
        width: w*.95,
        height: 45,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius
                        .circular(8)),
                backgroundColor: Color(
                    0xff2A62B8)),
            onPressed: () {
              //Get.to(Holiday_Calender());
            },
            child: const Text(
              "Submit",
              style: TextStyle(fontSize: 15,
                  fontFamily: 'Lato'),
            )),
      ),
          ]),
        ),
        ),
    );
  }
}
