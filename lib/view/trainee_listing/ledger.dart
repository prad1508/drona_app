
import 'package:cached_network_image/cached_network_image.dart';
import 'package:drona/res/app_url.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../model/trainee_list_model.dart';


import '../../data/response/status.dart';
import '../../res/language/language.dart';

class Ledger_Page extends StatefulWidget {
  String traineeProfileUid;
  int index;
  List<Datum> traineeList;



  Ledger_Page({super.key, required this.traineeProfileUid, required this.index, required this.traineeList});

  @override
  State<Ledger_Page> createState() => _Ledger_PageState();
}

class _Ledger_PageState extends State<Ledger_Page> {

  TraineeViewModel traineeViewModel = TraineeViewModel();

  String name = "Riyaz mohammed";

  Map<String, dynamic> data = {

  };
  int pageCount = 10;
  int pageNo = 1;


  @override
  void initState() {
    traineeViewModel.fetchLedgerListSearchApi({"trainee_profile_uid":widget.traineeProfileUid}, pageCount, pageNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title:  Text(AppLocale.viewLedge.getString(context),

            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<TraineeViewModel>(
          create: (context) => traineeViewModel,
          child: Consumer<TraineeViewModel>(
            builder: (context, value, _){
              switch(value.dataList1.status!){

                case Status.loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.completed:
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        //color: Colors.grey,
                        width: w,
                        height: h * 0.08,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Profile Image;
                              SizedBox(
                                height: h * 0.05,
                                width: w * 0.1,
                                child:   CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: CachedNetworkImage(
                                        fit: BoxFit.contain,
                                        imageUrl: AppUrl.ouserProfileimgListEndPoint +widget.traineeList[widget.index].image,
                                        errorWidget: (context, url, error) =>
                                        // Image.asset("assets/images/user.png")
                                        const Icon(Icons.person,size: 30,color: Colors.white,)


                                    )
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.traineeList[widget.index].traineeName,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        widget.traineeList[widget.index].join_status == "not_onboarded" ? AppLocale.notOnboarded.getString(context): AppLocale.onboarded.getString(context),
                                        style:
                                        TextStyle(color: widget.traineeList[widget.index].join_status == "not_onboarded" ? Colors.red :Colors.green, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  //Gender and Age;
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:  [
                                        Text(
                                          widget.traineeList[widget.index].gender,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "|",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      //  Text("Dob :"),

                                        Text(
                                          widget.traineeList[widget.index].dob,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                width: 35,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(AppUrl.serviceIconEndPoint+widget.traineeList[widget.index].serviceicon),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(height: h * 0.005),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: Colors.grey.shade50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: SizedBox(
                            width: w,
                            height: h * 0.08,
                            child: Column(children: [
                              Center(
                                child: Container(
                                  width: w*0.85,
                                  height: h*0.08,
                                  decoration: BoxDecoration(
                                    //color: Colors.grey
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Text(
                                           "₹${widget.traineeList[widget.index].fees}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: CircleAvatar(
                                              backgroundColor: Color(0xff173564),
                                              child: Icon(
                                                Icons.currency_rupee,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                     Text(

                                       AppLocale.dueOn.getString(context).trParams({"key":widget.traineeList[widget.index].monthOfBilling}),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(height: h*0.05),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.98,
                          child: DataTable(
                            columnSpacing: 40,
                            dataRowHeight: 45,
                            headingRowColor: MaterialStatePropertyAll(Color(0xffEAEFF8)),
                            headingRowHeight: 35,
                            dividerThickness: double.infinity,
                            columns:  <DataColumn>[
                              DataColumn(label: Text("#")),
                              DataColumn(label: Text(AppLocale.month.getString(context),),),
                              DataColumn(label: Text(AppLocale.fee.getString(context),)),
                              DataColumn(label: Text(AppLocale.due.getString(context),)),
                            ],
                            //Data Table Row;
                            rows: value.dataList1.data!.data.map((e) {
                              return  DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                        Text(
                                          widget.index.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Lato',
                                              color: Color(0xff39404A)),
                                        )),
                                    DataCell(Text(
                                      e.mm,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Lato',
                                          color: Color(0xff39404A)),
                                    )),
                                    DataCell(
                                      Text(
                                        e.fees.toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Lato',
                                            color: Color(0xff39404A)),
                                      ),
                                    ),

                                    DataCell(Text(
                                      e.due.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Lato',
                                          color: Color(0xff39404A)),
                                    ))]);}

                            ).toList(),


                          ),
                        ),
                      ),

                      /* Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 342,
                          height: 45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: Color(0xff2A62B8)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        width: 342,
                                        height: 266,
                                        child: AlertDialog(
                                          icon: SizedBox(
                                            width: 44,
                                            height: 44,
                                            child: CircleAvatar(
                                              backgroundColor: Color(0xffFEC259),
                                              child: Icon(
                                                Icons.priority_high_rounded,
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            "Send Reminder",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          alignment: Alignment.center,
                                          content: Wrap(children: const [
                                            Center(
                                              child: SizedBox(
                                                width: 209,
                                                height: 48,
                                                child: Text(
                                                  "Are You Sure You Want To Send Reminder To Riyaz Mohammed?",
                                                  style: TextStyle(
                                                      color: Color(0xff626D7E),
                                                      fontSize: 16,
                                                      fontFamily: 'Lato',
                                                      fontWeight: FontWeight.w400),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          // contentPadding: EdgeInsets.all(24),
                                          actions: [
                                            SizedBox(
                                              width: 139,
                                              height: 48,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Color(0xffDFE1E4),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(8)))),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color: Color(0xff23282E),
                                                        fontSize: 15,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w600),
                                                  )),
                                            ),
                                            Container(
                                              width: 139,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8)),
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Color(0xff2A62B8),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(8)))),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Confirm",
                                                    style: TextStyle(
                                                        color: Color(0xffFBFBFC),
                                                        fontSize: 15,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w600),
                                                  )),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: const Text(
                                "Reminder",
                                style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                              )),
                        ),
                      ),*/
                    ],
                  );

                case Status.error:
                  return Center(child: Text(AppLocale.noData.getString(context)));
              }

            },
          ),
        ),
      ),
    );
  }
}

