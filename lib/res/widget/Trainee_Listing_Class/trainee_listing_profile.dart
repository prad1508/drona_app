// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/trainee_list_model.dart';
import '../../../respository/trainee_repositry.dart';
import '../../../view_model/trainee_view_model.dart';

class Trainee_Listing_Profile extends StatefulWidget {
  const Trainee_Listing_Profile({super.key});

  @override
  State<Trainee_Listing_Profile> createState() =>
      _Trainee_Listing_ProfileState();
}

class _Trainee_Listing_ProfileState extends State<Trainee_Listing_Profile> {
  TraineeViewModel traineeViewModel = TraineeViewModel();
  Map<String, dynamic> data = {"filter_batch_uid": "", "search": ""};


  @override
  initState() {
    super.initState();
    traineeViewModel.fetchTraineeListSearchApi(data);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 390,
              height: 114,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, top: 15.0, right: 15),
                child:

                ChangeNotifierProvider<TraineeViewModel>(
                    create: (BuildContext context) => traineeViewModel,
                    child: Consumer<TraineeViewModel>(
                        builder: (context, value, _) {
                          print("value is");
                          print(value.dataList.data!.data.length);
                         print(value.dataList);
                          return ListView.builder(
                            itemCount: value.dataList.data!.data.length,
                              itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Divider(),
                                  SizedBox(
                                    width: 390,
                                    height: 114,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 24.0, top: 15.0, right: 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 41,
                                                height: 46,
                                                child: CircleAvatar(
                                                    backgroundImage:
                                                    AssetImage('assets/images/user_profile.png')),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  width: 44,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff47C088),
                                                      borderRadius: BorderRadius.circular(4)),
                                                  child: Center(
                                                    child: Text(
                                                      "Active",
                                                      style: TextStyle(
                                                          color: Color(0xffFBFBFC),
                                                          fontSize: 10,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15.0),
                                                    child: SizedBox(
                                                      width: 95,
                                                      height: 17,
                                                      child: Text(
                                traineeViewModel.dataList.data!
                                    .data[index].traineeName,
                                                        style: TextStyle(
                                                            color: Color(0xff39404A),
                                                            fontSize: 14,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w700),
                                                      ),
                                                    ),
                                                  ),
                                                  //SizedBox(width: 10),
                                                  Container(
                                                    width: 67,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffEDF9F3),
                                                        borderRadius: BorderRadius.circular(4)),
                                                    child: Center(
                                                      child: Text(
                                                        "Onboarded",
                                                        style: TextStyle(
                                                            color: Color(0xff47C088),
                                                            fontSize: 10,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    widthFactor: 4.7,
                                                    child: SizedBox(
                                                      width: 24,
                                                      height: 24,
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                        AssetImage('assets/images/Golf.png'),
                                                        backgroundColor: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 1),
                                              Row(
                                                children: const [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15.0),
                                                    child: Text(
                                                      "Male ",
                                                      style: TextStyle(
                                                          color: Color(0xff39404A),
                                                          fontSize: 12,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                  Text(
                                                    "|",
                                                    style: TextStyle(
                                                        color: Color(0xff39404A),
                                                        fontSize: 12,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                  Text(
                                                    " 34 Year",
                                                    style: TextStyle(
                                                        color: Color(0xff39404A),
                                                        fontSize: 12,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w400),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 12),
                                              Row(
                                                children: const [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15.0),
                                                    child: Text(
                                                      "Golf Batch Evening",
                                                      style: TextStyle(
                                                          color: Color(0xff39404A),
                                                          fontSize: 14,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w700),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    widthFactor: 1.9,
                                                    child: Text(
                                                      "04:00 PM to 05:30 PM",
                                                      style: TextStyle(
                                                          color: Color(0xff39404A),
                                                          fontSize: 12,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15.0),
                                                    child: Row(
                                                      children: const [
                                                        Text(
                                                          "Fee : ",
                                                          style: TextStyle(
                                                              color: Color(0xff39404A),
                                                              fontSize: 14,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w700),
                                                        ),
                                                        Text(
                                                          "₹10,000",
                                                          style: TextStyle(
                                                              color: Color(0xff39404A),
                                                              fontSize: 12,
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w400),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 155),
                                                  Row(
                                                    children: const [
                                                      Text(
                                                        "Due : ",
                                                        style: TextStyle(
                                                            color: Color(0xff39404A),
                                                            fontSize: 14,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w700),
                                                      ),
                                                      Text(
                                                        "₹10,000",
                                                        style: TextStyle(
                                                            color: Color(0xff39404A),
                                                            fontSize: 12,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                                    }

                          );
                        })),















                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         SizedBox(
                //           width: 41,
                //           height: 46,
                //           child: CircleAvatar(
                //               backgroundImage:
                //                   AssetImage('assets/images/user_profile.png')),
                //         ),
                //         Align(
                //           alignment: Alignment.bottomLeft,
                //           child: Container(
                //             width: 44,
                //             height: 20,
                //             decoration: BoxDecoration(
                //                 color: Color(0xff47C088),
                //                 borderRadius: BorderRadius.circular(4)),
                //             child: Center(
                //               child: Text(
                //                 "Active",
                //                 style: TextStyle(
                //                     color: Color(0xffFBFBFC),
                //                     fontSize: 10,
                //                     fontFamily: 'Lato',
                //                     fontWeight: FontWeight.w600),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.only(left: 15.0),
                //               child: Text(
                //                 "Riyaz Mohammed",
                //                 style: TextStyle(
                //                     color: Color(0xff39404A),
                //                     fontSize: 14,
                //                     fontFamily: 'Lato',
                //                     fontWeight: FontWeight.w700),
                //               ),
                //             ),
                //             SizedBox(width: 10),
                //             Container(
                //               width: 67,
                //               height: 20,
                //               decoration: BoxDecoration(
                //                   color: Color(0xffEDF9F3),
                //                   borderRadius: BorderRadius.circular(4)),
                //               child: Center(
                //                 child: Text(
                //                   "Onboarded",
                //                   style: TextStyle(
                //                       color: Color(0xff47C088),
                //                       fontSize: 10,
                //                       fontFamily: 'Lato',
                //                       fontWeight: FontWeight.w400),
                //                 ),
                //               ),
                //             ),
                //             Align(
                //               alignment: Alignment.centerRight,
                //               widthFactor: 4.5,
                //               child: SizedBox(
                //                 width: 24,
                //                 height: 24,
                //                 child: CircleAvatar(
                //                   backgroundImage:
                //                       AssetImage('assets/images/tennis.png'),
                //                   backgroundColor: Colors.white,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(height: 1),
                //         Row(
                //           children: const [
                //             Padding(
                //               padding: const EdgeInsets.only(left: 15.0),
                //               child: Text(
                //                 "Male ",
                //                 style: TextStyle(
                //                     color: Color(0xff39404A),
                //                     fontSize: 12,
                //                     fontFamily: 'Lato',
                //                     fontWeight: FontWeight.w400),
                //               ),
                //             ),
                //             Text(
                //               "|",
                //               style: TextStyle(
                //                   color: Color(0xff39404A),
                //                   fontSize: 12,
                //                   fontFamily: 'Lato',
                //                   fontWeight: FontWeight.w400),
                //             ),
                //             Text(
                //               " 34 Year",
                //               style: TextStyle(
                //                   color: Color(0xff39404A),
                //                   fontSize: 12,
                //                   fontFamily: 'Lato',
                //                   fontWeight: FontWeight.w400),
                //             )
                //           ],
                //         ),
                //         SizedBox(height: 12),
                //         Row(
                //           children: const [
                //             Padding(
                //               padding: const EdgeInsets.only(left: 15.0),
                //               child: Text(
                //                 "Tennis Batch Evening",
                //                 style: TextStyle(
                //                     color: Color(0xff39404A),
                //                     fontSize: 14,
                //                     fontFamily: 'Lato',
                //                     fontWeight: FontWeight.w700),
                //               ),
                //             ),
                //             Align(
                //               alignment: Alignment.centerRight,
                //               widthFactor: 1.8,
                //               child: Text(
                //                 "03:00 PM to 05:30 PM",
                //                 style: TextStyle(
                //                     color: Color(0xff39404A),
                //                     fontSize: 12,
                //                     fontFamily: 'Lato',
                //                     fontWeight: FontWeight.w400),
                //               ),
                //             )
                //           ],
                //         ),
                //         SizedBox(height: 5),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.only(left: 15.0),
                //               child: Row(
                //                 children: const [
                //                   Text(
                //                     "Fee : ",
                //                     style: TextStyle(
                //                         color: Color(0xff39404A),
                //                         fontSize: 14,
                //                         fontFamily: 'Lato',
                //                         fontWeight: FontWeight.w700),
                //                   ),
                //                   Text(
                //                     "₹15,000",
                //                     style: TextStyle(
                //                         color: Color(0xff39404A),
                //                         fontSize: 12,
                //                         fontFamily: 'Lato',
                //                         fontWeight: FontWeight.w400),
                //                   )
                //                 ],
                //               ),
                //             ),
                //             SizedBox(width: 155),
                //             Row(
                //               children: const [
                //                 Text(
                //                   "Due : ",
                //                   style: TextStyle(
                //                       color: Color(0xff39404A),
                //                       fontSize: 14,
                //                       fontFamily: 'Lato',
                //                       fontWeight: FontWeight.w700),
                //                 ),
                //                 Text(
                //                   "₹30,000",
                //                   style: TextStyle(
                //                       color: Color(0xff39404A),
                //                       fontSize: 12,
                //                       fontFamily: 'Lato',
                //                       fontWeight: FontWeight.w400),
                //                 ),
                //               ],
                //             )
                //           ],
                //         )
                //       ],
                //     ),
                //   ],
                // ),
              ),
            ),
            // Divider(),
            // SizedBox(
            //   width: 390,
            //   height: 114,
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.only(left: 24.0, top: 15.0, right: 15),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               width: 41,
            //               height: 46,
            //               child: CircleAvatar(
            //                   backgroundImage:
            //                       AssetImage('assets/images/user_profile.png')),
            //             ),
            //             Align(
            //               alignment: Alignment.bottomLeft,
            //               child: Container(
            //                 width: 44,
            //                 height: 20,
            //                 decoration: BoxDecoration(
            //                     color: Color(0xff47C088),
            //                     borderRadius: BorderRadius.circular(4)),
            //                 child: Center(
            //                   child: Text(
            //                     "Active",
            //                     style: TextStyle(
            //                         color: Color(0xffFBFBFC),
            //                         fontSize: 10,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w600),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: SizedBox(
            //                     width: 95,
            //                     height: 17,
            //                     child: Text(
            //                       "Somesh Nanda",
            //                       style: TextStyle(
            //                           color: Color(0xff39404A),
            //                           fontSize: 14,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w700),
            //                     ),
            //                   ),
            //                 ),
            //                 //SizedBox(width: 10),
            //                 Container(
            //                   width: 67,
            //                   height: 20,
            //                   decoration: BoxDecoration(
            //                       color: Color(0xffEDF9F3),
            //                       borderRadius: BorderRadius.circular(4)),
            //                   child: Center(
            //                     child: Text(
            //                       "Onboarded",
            //                       style: TextStyle(
            //                           color: Color(0xff47C088),
            //                           fontSize: 10,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w400),
            //                     ),
            //                   ),
            //                 ),
            //                 Align(
            //                   alignment: Alignment.centerRight,
            //                   widthFactor: 4.7,
            //                   child: SizedBox(
            //                     width: 24,
            //                     height: 24,
            //                     child: CircleAvatar(
            //                       backgroundImage:
            //                           AssetImage('assets/images/Golf.png'),
            //                       backgroundColor: Colors.white,
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(height: 1),
            //             Row(
            //               children: const [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: Text(
            //                     "Male ",
            //                     style: TextStyle(
            //                         color: Color(0xff39404A),
            //                         fontSize: 12,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w400),
            //                   ),
            //                 ),
            //                 Text(
            //                   "|",
            //                   style: TextStyle(
            //                       color: Color(0xff39404A),
            //                       fontSize: 12,
            //                       fontFamily: 'Lato',
            //                       fontWeight: FontWeight.w400),
            //                 ),
            //                 Text(
            //                   " 34 Year",
            //                   style: TextStyle(
            //                       color: Color(0xff39404A),
            //                       fontSize: 12,
            //                       fontFamily: 'Lato',
            //                       fontWeight: FontWeight.w400),
            //                 )
            //               ],
            //             ),
            //             SizedBox(height: 12),
            //             Row(
            //               children: const [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: Text(
            //                     "Golf Batch Evening",
            //                     style: TextStyle(
            //                         color: Color(0xff39404A),
            //                         fontSize: 14,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w700),
            //                   ),
            //                 ),
            //                 Align(
            //                   alignment: Alignment.centerRight,
            //                   widthFactor: 1.9,
            //                   child: Text(
            //                     "04:00 PM to 05:30 PM",
            //                     style: TextStyle(
            //                         color: Color(0xff39404A),
            //                         fontSize: 12,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w400),
            //                   ),
            //                 )
            //               ],
            //             ),
            //             SizedBox(height: 5),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: Row(
            //                     children: const [
            //                       Text(
            //                         "Fee : ",
            //                         style: TextStyle(
            //                             color: Color(0xff39404A),
            //                             fontSize: 14,
            //                             fontFamily: 'Lato',
            //                             fontWeight: FontWeight.w700),
            //                       ),
            //                       Text(
            //                         "₹10,000",
            //                         style: TextStyle(
            //                             color: Color(0xff39404A),
            //                             fontSize: 12,
            //                             fontFamily: 'Lato',
            //                             fontWeight: FontWeight.w400),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 SizedBox(width: 155),
            //                 Row(
            //                   children: const [
            //                     Text(
            //                       "Due : ",
            //                       style: TextStyle(
            //                           color: Color(0xff39404A),
            //                           fontSize: 14,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w700),
            //                     ),
            //                     Text(
            //                       "₹10,000",
            //                       style: TextStyle(
            //                           color: Color(0xff39404A),
            //                           fontSize: 12,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w400),
            //                     ),
            //                   ],
            //                 )
            //               ],
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(),
            // SizedBox(
            //   width: 390,
            //   height: 91,
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.only(left: 24.0, top: 15.0, right: 15),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               width: 41,
            //               height: 46,
            //               child: CircleAvatar(
            //                   backgroundImage:
            //                       AssetImage('assets/images/user_profile.png')),
            //             ),
            //             Align(
            //               alignment: Alignment.bottomLeft,
            //               child: Container(
            //                 width: 44,
            //                 height: 20,
            //                 decoration: BoxDecoration(
            //                     color: Color(0xffE8EBF0),
            //                     borderRadius: BorderRadius.circular(4)),
            //                 child: Center(
            //                   child: Text(
            //                     "Inactive",
            //                     style: TextStyle(
            //                         color: Color(0xff173564),
            //                         fontSize: 10,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w600),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: SizedBox(
            //                     width: 92,
            //                     height: 17,
            //                     child: Text(
            //                       "Arush Mishra",
            //                       style: TextStyle(
            //                           color: Color(0xff39404A),
            //                           fontSize: 14,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w700),
            //                     ),
            //                   ),
            //                 ),
            //                 //SizedBox(width: 2),
            //                 Container(
            //                   width: 67,
            //                   height: 20,
            //                   decoration: BoxDecoration(
            //                       color: Color(0xffFFE8E7),
            //                       borderRadius: BorderRadius.circular(4)),
            //                   child: Center(
            //                     child: Text(
            //                       "Not Onboarded",
            //                       style: TextStyle(
            //                           color: Color(0xffFD1D0D),
            //                           fontSize: 10,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w400),
            //                     ),
            //                   ),
            //                 ),
            //                 Align(
            //                   alignment: Alignment.centerRight,
            //                   widthFactor: 4.7,
            //                   child: SizedBox(
            //                       width: 25,
            //                       height: 25,
            //                       child: Icon(
            //                         Icons.help_outline_outlined,
            //                         color: Color(0xff626D7E),
            //                       )
            //                       // CircleAvatar(
            //                       //     backgroundImage:
            //                       //         AssetImage('assets/images/Golf.png'),
            //                       //     backgroundColor: Colors.white,
            //                       //     ),
            //                       ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(height: 1),
            //             Row(
            //               children: const [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: Text(
            //                     "Male ",
            //                     style: TextStyle(
            //                         color: Color(0xff39404A),
            //                         fontSize: 12,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w400),
            //                   ),
            //                 ),
            //                 Text(
            //                   "|",
            //                   style: TextStyle(
            //                       color: Color(0xff39404A),
            //                       fontSize: 12,
            //                       fontFamily: 'Lato',
            //                       fontWeight: FontWeight.w400),
            //                 ),
            //                 Text(
            //                   " 34 Year",
            //                   style: TextStyle(
            //                       color: Color(0xff39404A),
            //                       fontSize: 12,
            //                       fontFamily: 'Lato',
            //                       fontWeight: FontWeight.w400),
            //                 )
            //               ],
            //             ),
            //             SizedBox(height: 16),
            //             Padding(
            //               padding: const EdgeInsets.only(left: 15.0),
            //               child: Text(
            //                 "Unassigned",
            //                 style: TextStyle(
            //                     color: Color(0xff39404A),
            //                     fontSize: 14,
            //                     fontFamily: 'Lato',
            //                     fontWeight: FontWeight.w700),
            //               ),
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(),
            // SizedBox(
            //   width: 390,
            //   height: 114,
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.only(left: 24.0, top: 15.0, right: 15),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               width: 41,
            //               height: 46,
            //               child: CircleAvatar(
            //                   backgroundImage:
            //                       AssetImage('assets/images/user_profile.png')),
            //             ),
            //             Align(
            //               alignment: Alignment.bottomLeft,
            //               child: Container(
            //                 width: 44,
            //                 height: 20,
            //                 decoration: BoxDecoration(
            //                     color: Color(0xffF15E53),
            //                     borderRadius: BorderRadius.circular(4)),
            //                 child: Center(
            //                   child: Text(
            //                     "Inactive",
            //                     style: TextStyle(
            //                         color: Color(0xffFBFBFC),
            //                         fontSize: 10,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w600),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: SizedBox(
            //                     width: 92,
            //                     height: 17,
            //                     child: Text(
            //                       "Arush Mishra",
            //                       style: TextStyle(
            //                           color: Color(0xff39404A),
            //                           fontSize: 14,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w700),
            //                     ),
            //                   ),
            //                 ),
            //                 //SizedBox(width: 10),
            //                 Container(
            //                   width: 67,
            //                   height: 20,
            //                   decoration: BoxDecoration(
            //                       color: Color(0xffFFE8E7),
            //                       borderRadius: BorderRadius.circular(4)),
            //                   child: Center(
            //                     child: Text(
            //                       "Not Onboarded",
            //                       style: TextStyle(
            //                           color: Color(0xffFD1D0D),
            //                           fontSize: 10,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w400),
            //                     ),
            //                   ),
            //                 ),
            //                 Align(
            //                   alignment: Alignment.centerRight,
            //                   widthFactor: 4.7,
            //                   child: SizedBox(
            //                     width: 24,
            //                     height: 24,
            //                     child: CircleAvatar(
            //                       backgroundImage:
            //                           AssetImage('assets/images/tennis.png'),
            //                       backgroundColor: Colors.white,
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(height: 1),
            //             Row(
            //               children: const [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: Text(
            //                     "Male ",
            //                     style: TextStyle(
            //                         color: Color(0xff39404A),
            //                         fontSize: 12,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w400),
            //                   ),
            //                 ),
            //                 Text(
            //                   "|",
            //                   style: TextStyle(
            //                       color: Color(0xff39404A),
            //                       fontSize: 12,
            //                       fontFamily: 'Lato',
            //                       fontWeight: FontWeight.w400),
            //                 ),
            //                 Text(
            //                   " 34 Year",
            //                   style: TextStyle(
            //                       color: Color(0xff39404A),
            //                       fontSize: 12,
            //                       fontFamily: 'Lato',
            //                       fontWeight: FontWeight.w400),
            //                 )
            //               ],
            //             ),
            //             SizedBox(height: 12),
            //             Row(
            //               children: const [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: Text(
            //                     "Tennis Batch Evening",
            //                     style: TextStyle(
            //                         color: Color(0xff39404A),
            //                         fontSize: 14,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w700),
            //                   ),
            //                 ),
            //                 Align(
            //                   alignment: Alignment.centerRight,
            //                   widthFactor: 1.8,
            //                   child: Text(
            //                     "04:00 PM to 05:30 PM",
            //                     style: TextStyle(
            //                         color: Color(0xff39404A),
            //                         fontSize: 12,
            //                         fontFamily: 'Lato',
            //                         fontWeight: FontWeight.w400),
            //                   ),
            //                 )
            //               ],
            //             ),
            //             SizedBox(height: 5),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 15.0),
            //                   child: Row(
            //                     children: const [
            //                       Text(
            //                         "Fee : ",
            //                         style: TextStyle(
            //                             color: Color(0xff39404A),
            //                             fontSize: 14,
            //                             fontFamily: 'Lato',
            //                             fontWeight: FontWeight.w700),
            //                       ),
            //                       Text(
            //                         "₹10,000",
            //                         style: TextStyle(
            //                             color: Color(0xff39404A),
            //                             fontSize: 12,
            //                             fontFamily: 'Lato',
            //                             fontWeight: FontWeight.w400),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 SizedBox(width: 155),
            //                 Row(
            //                   children: const [
            //                     Text(
            //                       "Due : ",
            //                       style: TextStyle(
            //                           color: Color(0xff39404A),
            //                           fontSize: 14,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w700),
            //                     ),
            //                     Text(
            //                       "₹10,000",
            //                       style: TextStyle(
            //                           color: Color(0xff39404A),
            //                           fontSize: 12,
            //                           fontFamily: 'Lato',
            //                           fontWeight: FontWeight.w400),
            //                     ),
            //                   ],
            //                 )
            //               ],
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(),
          ],
        ),
      ),
    );
  }
}
