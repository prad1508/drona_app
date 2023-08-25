// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:drona/res/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/batch_Filter_model.dart';

class CoachFilter extends StatefulWidget {
  final void Function(/*String newSearch,*/ String myStatus, String onBoardStatus)
  search;
  const CoachFilter({
    super.key,
    required this.search,
  });

  @override
  State<CoachFilter> createState() => _CoachFilterState();
}

class _CoachFilterState extends State<CoachFilter> {
  int pageSize = 50;
  int newDataLength = 1;

  BatchFilterModel? batchFilterModel;
  List<Datum> myBatchList = [];
  Datum? dropValue1;
  String _value = "active";
  String _value1 = "onboarded";

/*
  void batchListApi() async {
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'token': token.toString()
    };
    var request = http.Request(
        'PUT', Uri.parse("${AppUrl.batchsearch}/$pageSize/$newDataLength"));
    request.body = json
        .encode({"filter_status": "", "filter_service_uid": "", "search": ""});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      */
/* if (kDebugMode) {
       print(await response.stream.bytesToString());
     }*//*

      var str = await response.stream.bytesToString();

      batchFilterModel = BatchFilterModel.fromJson(jsonDecode(str));

      var batchList = batchFilterModel!.data;
      setState(() {
        myBatchList.addAll(batchList);
      });
    } else {
      print(response.reasonPhrase);
    }
  }
*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //batchListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 34, 0, 12),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Filters",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 8,
        ),
      /*  const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Select Batch",
              style: TextStyle(color: Color(0xff39404A), fontSize: 12),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: DropdownButtonFormField(
            hint: const Text(
              "Select Batch",
              style: TextStyle(color: Color(0xff23282E), fontSize: 14),
            ),
            items: [
              for (final item in myBatchList)
                DropdownMenuItem(
                    value: item,
                    child: Text(
                      item.batchName.toString(),
                      style: TextStyle(color: Color(0xff23282E), fontSize: 14),
                    ))
            ],
            onChanged: (value) {
              setState(() {
                dropValue1 = value!;
                // dropdownV = dropValue!;
              });
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 133, 130, 130), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 133, 130, 130), width: 1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),*/
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Coach Status",
              style: TextStyle(color: Color(0xff39404A), fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: RadioListTile(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Active",
                    style: TextStyle(
                        color: Color(0xff39404A),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  value: "active",
                  groupValue: _value,
                  onChanged: (value) {
                    // print("my=>${value!}");
                    setState(() {
                      _value = value.toString();
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Inactive",
                    style: TextStyle(
                        color: Color(0xff39404A),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  value: "new",
                  groupValue: _value,
                  onChanged: (value) {
                    // print(value);
                    setState(() {
                      _value = value.toString();

                      // _value = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Unassigned",
                    style: TextStyle(
                        color: Color(0xff39404A),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  value: "unassigned",
                  groupValue: _value,
                  onChanged: (value) {
                    // print(value);
                    setState(() {
                      // _value = value!;

                      _value = value.toString();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Onboard Status",
              style: TextStyle(color: Color(0xff39404A), fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: RadioListTile(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Onboarded",
                    style: TextStyle(
                        color: Color(0xff39404A),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  value: "onboarded",
                  groupValue: _value1,
                  onChanged: (value) {
                    // print("my=>${value!}");
                    setState(() {
                      _value1 = value.toString();
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Not Onboarded",
                    style: TextStyle(
                        color: Color(0xff39404A),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  value: "not_onboarded",
                  groupValue: _value1,
                  onChanged: (value) {
                    // print(value);
                    setState(() {
                      _value1 = value.toString();

                      // _value = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color(0xffDFE1E4)),
                  onPressed: () {
                    widget.search("", "");
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Clear All',
                    style: TextStyle(
                        color: Color(0xff23282E),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color(0xff2A62B8)),
                  onPressed: () {
                    // print("valuedrop==> ${dropValue!.serviceName.toString()}");

                    widget.search(
                        /*dropValue1!.batchName.toString(),*/ _value, _value1);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: Color(0xffFBFBFC)),
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
