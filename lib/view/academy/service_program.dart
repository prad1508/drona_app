// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../view_model/academy_view_model.dart';
import '../Academy_Listing/facility_program.dart';
import '../Academy_Listing/service_offring_page.dart';

class Servicelist_Page extends StatefulWidget {
  const Servicelist_Page({super.key});

  @override
  State<Servicelist_Page> createState() => _Servicelist_PageState();
}

class _Servicelist_PageState extends State<Servicelist_Page> {
  AcademyViewViewModel academyListViewViewModel = AcademyViewViewModel();

  initState() {
    super.initState();
    academyListViewViewModel.fetchAcademyListApi();
  }


  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Service And Program',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
        actions: [
          //Chosse service and programme;
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(Icons.add),
              ),
            ),
            onTap: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Service_Offering_Page()),
              );*/
              Get.to(()=> const Service_Offering_Page(),transition: Transition.rightToLeft);

            },
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //Listing of Academy Sercive and Programe;
                  SizedBox(height: 15),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: h*0.8,
                      child:
                      ChangeNotifierProvider<AcademyViewViewModel>(
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
                              return
                                ListView.builder(
                                    itemCount: value.dataList.data?.totalService,
                                    itemBuilder: (context, index) {
                                      return
                                        Column(
                                          children: [
                                            ListTile(
                                              onTap: () {
                                                Get.to(() =>  FacilityProgram(serviceUid: value.dataList.data!.services[index].uid,),
                                                    transition: Transition.rightToLeft);
                                              },
                                              contentPadding: EdgeInsets.all(5),
                                              leading: SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: Image(
                                                  image: NetworkImage(AppUrl.serviceIconEndPoint + value.dataList.data!.services[index].serviceIconname!,
                                                  ),),
                                              ),
                                              title: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  value.dataList.data!.services[index].serviceName,
                                                  style: TextStyle(
                                                    color: Color(0xff39404A),
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              trailing: Container(
                                                width: w*0.2,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      value.dataList.data!.services[index].status,
                                                      style: TextStyle(
                                                        color: value.dataList.data!.services[index].status == "active" ? Colors.green : Colors.red,
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios_outlined,
                                                      size: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Divider(),
                                          ],
                                        );
                                    }
                                );
                            case Status.error:
                              return Center(
                                  child: Text(''));
                          }

                        }
                        ),
                      )
                  )
                ],
              ),
            ),
          )),
    );
  }
}