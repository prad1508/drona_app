import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_details_page.dart';
import 'category_list.dart';

class AssessmentSummary extends StatefulWidget {
  const AssessmentSummary({super.key});

  @override
  State<AssessmentSummary> createState() => _AssessmentSummaryState();
}

class _AssessmentSummaryState extends State<AssessmentSummary> {

  List<Map<String, String>> assessmentData=[
    {
      'title': 'Assessment 1',
      'subtitle': 'Thursday, April 13, 2023',
    }
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Assessment Summary',
            style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Lato')),
        actions: [Padding(padding: const EdgeInsets.only(right: 5),
        child: IconButton(onPressed: () {
          Get.to(const CategoryList());

        }, icon: const Icon(Icons.add)),
        )],
        elevation: 0,
      ),
      body:  SafeArea(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Profile Details
    Padding(padding: const EdgeInsets.only(left: 40,right: 20),
    child: SizedBox(
//color: Colors.grey,
      width: w,
      height: h * 0.08,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Profile Image;
              SizedBox(
                height: h * 0.05,
                width: w * 0.05,
                child:  const CircleAvatar(
                  backgroundColor: Colors.black,
                  // child: CachedNetworkImage(
                  //     fit: BoxFit.contain,
                  //     imageUrl: AppUrl.ouserProfileimgListEndPoint +widget.traineeList[widget.index].image,
                  //     errorWidget: (context, url, error) =>
                  //     // Image.asset("assets/images/user.png")
                  //     const Icon(Icons.person,size: 30,color: Colors.white,)
                  //
                  //
                  // )
                  /* Text(
                                  getInitials(widget
                                      .traineeList[widget.index].traineeName),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),*/
                  // backgroundImage: getInitials(value.dataList.data!.data[index].traineeName),
                ),
              ),
//SizedBox(width: w*0.05,),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Riyaz mohammed",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ), Text(
                        "Onboarded",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 10),
                      ),
                    ],
                  ),
//Gender and Age;
                  SizedBox(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 12),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "|",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        //Text("Dob :"),
                        Text(
                          "34 Years",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.sports_baseball,color: Colors.black),
                  ),
                ),
              )
            ],
          )),
    ),
    ),
          Container(
            width: w*.8,
            height: h*.4,
            decoration: const BoxDecoration(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Padding(padding: EdgeInsets.only(left: 15),
          child: Text("Assessment List",style: TextStyle(fontSize: 14,fontFamily: 'Lato'),),
          ),
          const SizedBox(height: 10),

          //Dynamic Listtile

           // ListView.builder(
           //     itemCount: assessmentData.length,
           //     itemBuilder: (BuildContext context, int index)
           // {
           //   return ListTile(title: const Text("Assessment 1",style: TextStyle(fontSize: 14,fontFamily: 'Lato',fontWeight: FontWeight.w700),),
           //     subtitle: const Row(children: [
           //       //SizedBox(height: 5),
           //       Text("Thursday,",style: TextStyle(fontSize: 12,fontFamily: 'Lato',fontWeight: FontWeight.w500),),
           //       Text(" April 13, 2023",style: TextStyle(fontSize: 12,fontFamily: 'Lato',fontWeight: FontWeight.w500),),
           //     ]),
           //     trailing: const Icon(Icons.arrow_forward_ios_rounded),
           //     onTap: () {
           //       Get.to(Assessment_Details_Page());
           //     },
           //   );
           // }
           // ),

        ListTile(title: const Text("Assessment 1",style: TextStyle(fontSize: 14,fontFamily: 'Lato',fontWeight: FontWeight.w700),),
          subtitle: const Row(children: [
            //SizedBox(height: 5),
            Text("Thursday,",style: TextStyle(fontSize: 12,fontFamily: 'Lato',fontWeight: FontWeight.w500),),
            Text(" April 13, 2023",style: TextStyle(fontSize: 12,fontFamily: 'Lato',fontWeight: FontWeight.w500),),
          ]),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Get.to(const Assessment_Details_Page());
          },
        ),
           const Divider(),
           ListTile(title: const Text("Assessment 2",style: TextStyle(fontSize: 14,fontFamily: 'Lato',fontWeight: FontWeight.w700),),
            subtitle: const Row(children: [
              //SizedBox(height: 5),
              Text("Thursday,",style: TextStyle(fontSize: 12,fontFamily: 'Lato',fontWeight: FontWeight.w500),),
              Text(" May 13, 2023",style: TextStyle(fontSize: 12,fontFamily: 'Lato',fontWeight: FontWeight.w500),),
            ]),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
             onTap: () {

             },
          ),
          const Divider(),
           ListTile(title: const Text("Assessment 3",style: TextStyle(fontSize: 14,fontFamily: 'Lato',fontWeight: FontWeight.w700),),
            subtitle: const Row(children: [
              //SizedBox(height: 5),
              Text("Thursday,",style: TextStyle(fontSize: 12 ,fontFamily: 'Lato',fontWeight: FontWeight.w500),),
              Text(" June 13, 2023",style: TextStyle(fontSize: 12,fontFamily: 'Lato',fontWeight: FontWeight.w500),),
            ]),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
             onTap: () {

             },
          ),
    ]),
      ),
    );
  }
}
