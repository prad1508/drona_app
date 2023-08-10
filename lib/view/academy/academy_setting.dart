// ignore_for_file: prefer_const_constructors


import 'package:drona/view/academy/billing_invoice.dart';
import 'package:drona/view/academy/communication.dart';
import 'package:drona/view/academy/service_program.dart';
import 'package:drona/view/academy/academy_details.dart';
import 'package:drona/view/reports/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../view_model/academy_view_model.dart';
import 'Holiday_calender/confirm_holiday.dart';
import 'bank_detail.dart';


class academy_setting extends StatefulWidget {
  const academy_setting({super.key});

  @override
  State<academy_setting> createState() => _academy_settingState();
}

class _academy_settingState extends State<academy_setting> {
  AcademyViewViewModel academyListViewViewModel = AcademyViewViewModel();

  @override
  initState() {
    super.initState();
    academyListViewViewModel.fetchAcademyListApi();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text('Academy Setting',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          elevation: 0,
        ),
        body: SafeArea(
          child:  ChangeNotifierProvider<AcademyViewViewModel>(
              create: (BuildContext context) => academyListViewViewModel,
              child: Consumer<AcademyViewViewModel>(builder: (context, value, _) {
                switch (value.dataList.status!) {
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );

                  case Status.completed:
                    return Padding(
                      padding:  EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: const Color.fromARGB(255, 244, 247, 245),
                              elevation: 1,
                              child: Padding(
                                padding:  EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 12),
                                              child: Text(
                                                '${value.dataList.data?.academyname}',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 12),
                                                  child: Text(
                                                    'Services',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                      height: 2,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 4),
                                                  child: Container(
                                                    height: 20,
                                                    width: 150,
                                                    child: ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: value.dataList.data?.totalService,
                                                      itemBuilder: (context, index) {
                                                        return Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 4),
                                                          child: Image(
                                                            image: NetworkImage(
                                                              AppUrl.serviceIconEndPoint +
                                                                  value.dataList.data!.services![index].serviceIconname!,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            value.dataList.data!.islogo ?
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundColor: Colors.white,
                                              backgroundImage:

                                              NetworkImage(
                                                AppUrl.academylogo + value.dataList.data!.logo,
                                              ),
                                            ) :
                                            Image (
                                            image :
                                            AssetImage(
                                            'assets/images/coachlogo.png'), width: 80,)
                                          ],
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Text("Process"),
                                          Text("${value.dataList.data?.academyProgress} %"),
                                        ],
                                      ),
                                    ),
                                    LinearPercentIndicator(
                                      barRadius: Radius.circular(20),
                                      lineHeight: 6,
                                      percent: (value.dataList.data!.academyProgress/100),
                                      progressColor: Color(0xff2A62B8),
                                    ),
                                  ],
                                ),

                              )),
                          //Acadeny Report.
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              margin: EdgeInsets.only(bottom: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Academy Details",
                                        style: TextStyle(
                                            color: Color(0xff39404A),
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    title: value.dataList.data!.academyDetailsCompleted ?
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: AppColors.contentColorGreen.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "complete",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                        :
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "Incomplete",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 10,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                    ),
                                    onTap: () {
                                      /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const Academy_Detail_Page()),
                                    );*/
                                      Get.to(() => const Academy_Detail_Page(),
                                          transition: Transition.rightToLeft);
                                    },
                                  ),
                                  ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Service, Program & Facility",
                                        style: TextStyle(
                                            color: Color(0xff39404A),
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    title: value.dataList.data!.serviceProgramFacilityCompleted ?
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: AppColors.contentColorGreen.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "complete",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                        :
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "Incomplete",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 10,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => const Servicelist_Page()),
                                      // );
                                      Get.to(() => const Servicelist_Page(),
                                          transition: Transition.rightToLeft);
                                    },
                                  ),
                                  ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Bank Details",
                                        style: TextStyle(
                                            color: Color(0xff39404A),
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    title: value.dataList.data!.bankDetailsCompleted ?
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: AppColors.contentColorGreen.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "complete",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                        :
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "Incomplete",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 10,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => const Bank_Details()),
                                      // );
                                      Get.to(() =>  Bank_Details(),
                                          transition: Transition.rightToLeft);

                                    },
                                  ),
                                  ListTile(
                                      leading: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Communication",
                                            style: TextStyle(
                                                color: Color(0xff39404A),
                                                fontSize: 14,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w600),
                                          )
                                      ),
                                      title: value.dataList.data!.communicationCompleted ?
                                      Container(
                                        width: 100, // Adjust the width as needed
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4.0),
                                              decoration: BoxDecoration(
                                                color: AppColors.contentColorGreen.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                "complete",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 10,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                          :
                                      Container(
                                        width: 100, // Adjust the width as needed
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4.0),
                                              decoration: BoxDecoration(
                                                color: Colors.redAccent.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                "Incomplete",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 10,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                      ),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (
                                                context) => const Communication()),
                                        );
                                      }
                                  ),
                                  ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Billing And Invoices",
                                        style: TextStyle(
                                            color: Color(0xff39404A),
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    title: value.dataList.data!.billingInvoiceCompleted ?
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: AppColors.contentColorGreen.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "complete",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                        :
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "Incomplete",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 10,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,
                                      size: 15,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const Billing_And_Invoice()),
                                      );
                                    },
                                  ),

                                  ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Holiday Calender",
                                        style: TextStyle(
                                            color: Color(0xff39404A),
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,
                                      size: 15,
                                    ),
                                    onTap: () {
                                      Get.to(()=> const Confirm_Holiday(),transition: Transition.rightToLeft);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h*0.2,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 120.4,
                              height: 50,
                              child: Image(
                                alignment: Alignment.bottomCenter,
                                image: AssetImage('assets/images/logo2.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  case Status.error:
                    return Center(
                        child:Text(''));
                }
              })

          ),
        )
    );
  }
}
