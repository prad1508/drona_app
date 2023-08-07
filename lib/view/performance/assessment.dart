
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'assessment_summary.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        // title: const Text('Billing & Invoices',
        //     style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
        
      ),
      body: SafeArea(child: Column(
        children: [
          const SizedBox(height: 80),
        Center(
        child: Image.asset('assets/images/blankscreen.png',),
        ),
          const SizedBox(height: 10),
          const Text("No Assessment Found",style: TextStyle(color: Colors.black,fontFamily: 'Lato',fontSize: 16),),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,

              text: const TextSpan(

                  style: TextStyle(fontFamily: 'Lato',height: 1.5),
                  children: [TextSpan(text: 'Click on the\n',style: TextStyle(fontSize: 15,color: Color(0xff99A0AB))),
          TextSpan(text: 'Add Assessment',style: TextStyle(fontSize: 15,color: Color(0xff99A0AB),fontWeight: FontWeight.w500))
          ])),
          SizedBox(height: MediaQuery.of(context).size.height/3),
          SizedBox(
            width: 342,
            height: 45,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius
                            .circular(8)),
                    backgroundColor: const Color(
                        0xff2A62B8)),
                onPressed: () {
                  Get.to(() => const AssessmentSummary(),
                    transition: Transition.rightToLeft);
                },
                child: const Text(
                  "Add Assessment",
                  style: TextStyle(fontSize: 15,
                      fontFamily: 'Lato'),
                )),
          ),
      ],)),
    );
  }
}
