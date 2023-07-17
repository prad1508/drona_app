import 'package:drona/view/Support%20and%20Feedback/issue_Query_Page.dart';
import 'package:drona/view/Support%20and%20Feedback/suggestion_Feedback_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Support_Feedback_Page extends StatelessWidget {
  const Support_Feedback_Page({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        title: Text(
          'Support & Feedback',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          InkWell(
            child: Center(child:
            SizedBox(
                width: screenWidth*.9,
                height: 45,
                child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.info_outline,color: Color(0xff2A62B8)),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Issue Or Query",style: TextStyle(fontSize: 14,fontFamily: 'Lato'),),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text("Log your ticket for suppport here",style: TextStyle(fontSize: 14,fontFamily: 'Lato',color: Colors.grey[600]),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left:80 )),
                      Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 18,),

                    ]
                )
            ),
            ),
            onTap: () {
              Get.to(Issue_Query_Page());
            },
          ),
          const SizedBox(height: 30),
          InkWell(
            child: Center(child:
            SizedBox(
                width: screenWidth*.9,
                height: 45,
                child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search_rounded,color: Color(0xff2A62B8)),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Guide",style: TextStyle(fontSize: 14,fontFamily: 'Lato'),),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text("Learn more about our app here",style: TextStyle(fontSize: 14,fontFamily: 'Lato',color: Colors.grey[600]),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left:90 )),
                      Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 18,),
                    ]
                )
            ),
            ),
            onTap: () {
              //Get.to();
            },
          ),
          const SizedBox(height: 30),
          InkWell(
            child: Center(child:
            SizedBox(
                width: screenWidth*.9,
                height: 45,
                child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.lightbulb_outline_rounded,color: Color(0xff2A62B8)),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Suggestions Or Feedback?",style: TextStyle(fontSize: 14,fontFamily: 'Lato'),),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text("We want to here you!",style: TextStyle(fontSize: 14,fontFamily: 'Lato',color: Colors.grey[600]),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left:115 )),
                      Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 18,),

                    ]
                )
            ),
            ),
            onTap: () {
              Get.to(Suggestions_Feedbeak_Page());
            },
          )
        ],
      ),
    );
  }
}
