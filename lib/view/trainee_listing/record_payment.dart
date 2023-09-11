import 'package:cached_network_image/cached_network_image.dart';
import 'package:drona/res/language/language.dart';
import 'package:drona/res/widget/customradio.dart';
import 'package:drona/utils/utils.dart';
import 'package:drona/view/trainee_listing/add_trainee_list.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/trainee_list_model.dart';
import '../../res/app_url.dart';
import '../../res/widget/datefield.dart';
import '../../res/widget/progress_pills.dart';
import '../../view_model/trainee_view_model.dart';

class RecordPayment extends StatefulWidget {
  int index;
  double fess;
  List<Datum> traineeList;
  RecordPayment(
      {super.key,
        required this.traineeList,
        required this.index,
        required this.fess});

  @override
  State<RecordPayment> createState() => _RecordPaymentState();
}

class _RecordPaymentState extends State<RecordPayment> {
  TraineeViewModel traineeViewModel = TraineeViewModel();
  // ignore: non_constant_identifier_names
  List<String> PMode = ["Cash", "Online", "Cheque/\nDraft"];
  String selectedItem = 'Tennis';
  String selectedTiming = "Tennis Batch Morning";
  bool isCheckBox = false;
  bool isCheckBox2 = false;
  String? payment = 'cash';

  TextEditingController mController = TextEditingController();
  TextEditingController cController = TextEditingController();
  TextEditingController tDateController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController dateOfBilling = TextEditingController();
  double fixedFeeAmount = 0;

  @override
  void initState() {
    dateOfBilling.text = widget.traineeList[widget.index].monthOfBilling.toString();
    fixedFeeAmount = widget.fess;
    feeController.text = fixedFeeAmount.toStringAsFixed(2);
    super.initState();
    // Add listeners to the mController and cController
    mController.addListener(updateFeeController);
    cController.addListener(updateFeeController);
  }

  @override
  void dispose() {
    // Clean up the controllers
    feeController.dispose();
    mController.dispose();
    cController.dispose();
    tDateController.dispose();
    super.dispose();
  }

  void updateFeeController() {
    // Parse the text values to doubles
    double mValue = double.tryParse(mController.text) ?? 0.0;
    double cValue = double.tryParse(cController.text) ?? 0.0;

    // If both mController and cController are empty, set feeController to fixedFeeAmount
    if (mController.text.isEmpty && cController.text.isEmpty) {
      feeController.text = fixedFeeAmount.toStringAsFixed(2);
      return;
    }

    // Calculate the new fee value based on the fixedFeeAmount, mValue, and cValue
    double newFeeValue = fixedFeeAmount + mValue - cValue;

    // Check if the new fee value is less than fixedFeeAmount
    if (newFeeValue < fixedFeeAmount) {
      Utils.flushBarErrorMessage("Amount not less than fees", context);
      feeController.text = fixedFeeAmount.toStringAsFixed(2);

      // Show an error or handle it as per your requirement
      print("Amount not less than $fixedFeeAmount");
    } else {
      // Update the feeController's value
      feeController.text = newFeeValue.toStringAsFixed(2);
    }
  }

  ValueChanged<String?> RecordPayment() {
    return (value) => setState(() => payment = value!);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title:  Text(
          AppLocale.recordPayment.getString(context),
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Lato'),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0XFFDFE1E4).withOpacity(0.3),
                  //padding: const EdgeInsets.all(5),
                  height: h*0.17,
                  width: w*0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 4),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircleAvatar(
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
                              // AssetImage('assets/images/user_profile.png'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 40,
                              height: 20,
                              decoration: BoxDecoration(
                                color:
                                widget.traineeList[widget.index].status ==
                                    "active"
                                    ? const Color(0xff47C088)
                                    : Colors.redAccent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                  child:
                                  widget.traineeList[widget.index].status ==
                                      "active"
                                      ?  Text(
                                      AppLocale.active.getString(context),

                                    style: TextStyle(
                                      color: Color(0xffFBFBFC),
                                      fontSize: 10,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                      :  Text(
                                    AppLocale.inActive.getString(context),
                                    style: TextStyle(
                                      color: Color(0xffFBFBFC),
                                      fontSize: 10,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  widget.traineeList[widget.index].traineeName,
                                  style: const TextStyle(
                                    color: Color(0xff39404A),
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 20,
                                padding: const EdgeInsets.only(
                                    left: 5, right: 0, top: 2),
                                decoration: BoxDecoration(
                                    color: widget.traineeList[widget.index]
                                        .join_status ==
                                        'not_onboarded'
                                        ? const Color.fromRGBO(255, 232, 231, 1)
                                        : const Color(0xffEDF9F3),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  widget.traineeList[widget.index]
                                      .join_status ==
                                      'not_onboarded'
                                      ?AppLocale.notOnboarded.getString(context)
                                      :AppLocale.onboarded.getString(context)
                                  ,
                                  style: TextStyle(
                                      color: widget.traineeList[widget.index]
                                          .join_status ==
                                          'not_onboarded'
                                          ? const Color.fromRGBO(253, 29, 13, 1)
                                          : Colors.green,
                                      fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                widthFactor: 3.2,
                                child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.network(
                                      AppUrl.serviceIconEndPoint +
                                          widget.traineeList[widget.index]
                                              .serviceicon,
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 1),
                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child:
                                  widget.traineeList[widget.index].gender ==
                                      'male'
                                      ?  Text(
                                      AppLocale.male.getString(context)
                                      ,
                                    style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                      : widget.traineeList[widget.index]
                                      .gender ==
                                      'female'
                                      ?  Text(
                                    AppLocale.female.getString(context),

                                    style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                      :  Text(
                                    AppLocale.other.getString(context),

                                    style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                              const Text(
                                " | ",
                                style: TextStyle(
                                  color: Color(0xff39404A),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.traineeList[widget.index].dob,
                                style: const TextStyle(
                                  color: Color(0xff39404A),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .73,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    widget.traineeList[widget.index].batchname,
                                    style: const TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${widget.traineeList[widget.index].batch_timing_from} to ${widget.traineeList[widget.index].batch_timing_to}',
                                  style: const TextStyle(
                                    color: Color(0xff39404A),
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          //const SizedBox(height: 5),
                          Container(
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                       Text(
                                        "${AppLocale.fee.getString(context)} : ",
                                        style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '₹ ${widget.traineeList[widget.index].fees}',
                                        style: const TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 12,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     const Text(
                                  //       "Due : ",
                                  //       style: TextStyle(
                                  //         color: Color(0xff39404A),
                                  //         fontSize: 14,
                                  //         fontFamily: 'Lato',
                                  //         fontWeight: FontWeight.w700,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       '₹ ${value.dataList.data?.data[index].fees}',
                                  //       style: const TextStyle(
                                  //         color: Color(0xff39404A),
                                  //         fontSize: 12,
                                  //         fontFamily: 'Lato',
                                  //         fontWeight: FontWeight.w400,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      AppLocale.moB.getString(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                YearMonthPicker(
                    controller: dateOfBilling, hintText:AppLocale.moB.getString(context),
                ),
                SizedBox(
                  height: 12,
                ),
/*
                const Text(
                  "Last 6 Months Payment Status",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 5),
                //Color Step Line
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProgressPills(
                          number: 1,
                          active: 1,
                          color: Theme.of(context).primaryColorLight),
                    ],
                  ),
                ),*/

                const SizedBox(height: 20),
                Container(
                  width: 342,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff2A62B8)),
                      borderRadius: BorderRadius.circular(8)),
                  child: ExpansionTile(
                    childrenPadding: const EdgeInsets.all(8),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          AppLocale.totalFees.getString(context),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xff39404A),
                            fontFamily: 'Lato',
                          ),
                        ),
                        Text(
                          widget.traineeList[widget.index].fees.toString(),
                          style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xff39404A),
                            fontFamily: 'Lato',
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      SizedBox(
                        width: 300,
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isCheckBox,
                                  activeColor: Colors
                                      .blue, // Sets the background color when the checkbox is selected
                                  checkColor: Colors
                                      .white, // Sets the color of the checkmark when the checkbox is selected
                                  fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      // Sets the background color of the checkbox
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors.blue.withOpacity(0.8);
                                      }
                                      return Colors.grey;
                                    },
                                  ),
                                  onChanged: (v) {
                                    setState(() {
                                      isCheckBox = v!;
                                    });
                                  },
                                ),
                                Text(
                                  AppLocale.mISCFee.getString(context),
                                  style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato'),
                                ),
                                SizedBox(width: 40),
                                isCheckBox?  Container(
                                  width: 33,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Color(0xff2A62B8)),
                                      color: Color(0xff2A62B8),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8))),
                                  child: Center(
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ) : SizedBox(),
                                isCheckBox?  Container(
                                  width: 100,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Color(0xff2A62B8)),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  child: TextField(
                                    // controller: mController,
                                    onChanged: (v) {
                                      mController.text = v;
                                    },
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ): SizedBox(),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Checkbox(
                                  value: isCheckBox2,
                                  activeColor: Colors
                                      .blue, // Sets the background color when the checkbox is selected
                                  checkColor: Colors
                                      .white, // Sets the color of the checkmark when the checkbox is selected
                                  fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      // Sets the background color of the checkbox
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors.blue.withOpacity(0.8);
                                      }
                                      return Colors.grey;
                                    },
                                  ),
                                  onChanged: (v) {
                                    setState(() {
                                      isCheckBox2 = v!;
                                    });
                                  },
                                ),
                                Text(
                                  AppLocale.concession.getString(context),
                                  style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato'),
                                ),
                                SizedBox(width: 30),
                                isCheckBox2 ?  Container(
                                  width: 33,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Color(0xff2A62B8)),
                                      color: Color(0xff2A62B8),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8))),
                                  child: Center(
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ) : SizedBox(),
                                isCheckBox2 ? Container(
                                  width: 100,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Color(0xff2A62B8)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  child: TextField(
                                    //controller: cController,
                                    onChanged: (v) {
                                      cController.text = v;
                                    },
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ): SizedBox(),
                              ],
                            ),
                            // SizedBox(height: 12),
                            // Divider(thickness: 2,),
                            /*SizedBox(height: 12),
                            Row(
                              children: [
                                Text("Net Payable Fee"),
                                Text(mController.text+cController.text),

                              ],
                            )*/
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                //Payment Mode;
                Text(
                  AppLocale.paymentThrough.getString(context),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xff39404A),
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 4),
                //Payment Custom Radio Button
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomRadio<String>(
                        value: 'cash',
                        label: PMode[0],
                        groupValue: payment,
                        onChanged: RecordPayment(),
                        btnColor: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    CustomRadio<String>(
                        value: 'online',
                        label: PMode[1],
                        groupValue: payment,
                        onChanged: RecordPayment(),
                        btnColor: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    CustomRadio<String>(
                        value: 'd',
                        label: PMode[2],
                        groupValue: payment,
                        onChanged: RecordPayment(),
                        btnColor: Colors.black)
                  ],
                ),
                SizedBox(height: 30),
                //Date of Payment;
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          AppLocale.dateOfTransaction.getString(context),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff39404A),
                              fontFamily: 'Lato'),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                            width: 163,
                            height: 48,
                            child: TextFormField(
                              readOnly: true,
                              controller: tDateController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                  size: 30.0,
                                ),
                                hintText: '01-01-2023',
                                contentPadding: const EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onTap: () async {
                                DateTime now = DateTime.now();
                                DateTime firstDate =
                                DateTime(now.year, now.month);
                                var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: firstDate,
                                  lastDate:
                                  DateTime.now().add(Duration(days: 90)),
                                );
                                if (date != null) {
                                  tDateController.text =
                                      DateFormat('dd-MM-yyyy').format(date);
                                }
                              },
                            ))
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocale.feeCollected.getString(context),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff39404A),
                              fontFamily: 'Lato'),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: 163,
                          height: 48,
                          child: Row(
                            children: [
                              Container(
                                width: 51,
                                height: 48,
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Color(0xff2A62B8)),
                                    color: Color(0xff2A62B8),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8))),
                                child: const Center(
                                  child: Text(
                                    "₹/M",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Container(
                                width: 112,
                                height: 48,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff2A62B8)),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8))),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  readOnly: true,
                                  enabled: false,
                                  showCursor: false,
                                  controller: feeController,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(5),
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 50),
                //Payment Proof Uploder
              /*  Center(
                  child: DottedBorder(
                    color: Color(0xffEAEFF8),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffEAEFF8),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                backgroundColor: Color(0xffCCD9EE),
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  color: Color(0xff2A62B8),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Click To Upload Payment Proof",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff2A62B8),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Lato'),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "or just drag and drop",
                                    style: TextStyle(
                                        color: Color(0xff626D7E),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Lato'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 47),*/

                SizedBox(
                  width: 342,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Color(0xff2A62B8)),
                      onPressed: () {
                        //Dialog Box;
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
                                      backgroundColor: Color(0xff47C088),
                                      child: Icon(
                                        Icons.check_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    AppLocale.rcdPayment.getString(context),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  alignment: Alignment.center,
                                  content: Wrap(children: [
                                    Center(
                                      child: SizedBox(
                                        width: 209,
                                        height: 60,
                                        child: Text(
                                          AppLocale.confirmRecord.getString(context).trParams({"key": widget.traineeList[widget.index].traineeName}),
                                          style: TextStyle(
                                              color: Color(0xff626D7E),
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  // contentPadding: EdgeInsets.all(24),
                                  actions: [
                                    Container(
                                      width: 139,
                                      height: 48,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              Color(0xffDFE1E4),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(8)))),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child:  Text(
                                            AppLocale.cancel.getString(context),
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
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              Color(0xff2A62B8),
                                              shape:
                                              const RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          8)))),
                                          onPressed: () {
                                            Map<String, dynamic> data = {
                                              "trainee_profile_uid": widget
                                                  .traineeList[widget.index]
                                                  .traineeProfileUid,
                                              "fee_collected":
                                              feeController.text,
                                              "misc_fee": mController.text.isEmpty ? "0": mController.text,
                                              "concession": cController.text.isEmpty ? "0" : cController.text,
                                              "payment_mode": payment,
                                              "date_of_transaction":
                                              tDateController.text,
                                              "billing_month":
                                              dateOfBilling.text
                                            };
                                            print("data==$data");
                                            traineeViewModel
                                                .recordPaymentApiPost(
                                                data)
                                                .then((value) {
                                              Navigator.of(context).pop();

                                              Get.to(AddTraineeList(path: '',));
                                            });
                                          },
                                          child:  Text(
                                            AppLocale.confirm.getString(context),
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
                      child:  Text(
                        AppLocale.submit.getString(context),

                        style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return nameParts[0][0].toUpperCase() + nameParts[1][0].toUpperCase();
    } else if (nameParts.length == 1) {
      String firstName = nameParts[0];
      if (firstName.length >= 2) {
        return firstName.substring(0, 2).toUpperCase();
      } else {
        return firstName[0].toUpperCase();
      }
    } else {
      return '';
    }
  }
}


