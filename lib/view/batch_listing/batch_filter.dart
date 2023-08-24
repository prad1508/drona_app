import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/batch_Filter_model.dart';
import '../../model/myservices_model.dart';
import '../../res/app_url.dart';



class BatchFilterPage extends StatefulWidget {
  //final List<Data> drop;
  final void Function(String newSearch, String myStatus) search;
  const BatchFilterPage({
    super.key,
    /*required this.drop,*/
    required this.search,
  });
  @override
  State<BatchFilterPage> createState() => _BatchFilterPageState();
}

class _BatchFilterPageState extends State<BatchFilterPage> {
  Services? dropValue1;


  MyservicesListModel? myservicesListModel;

  List<Services>  myServiceList = [];


  void myServiceApi() async {
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    var headers = {
      'token': token.toString()
    };
    var request = http.Request('GET', Uri.parse(AppUrl.myservicesListEndPoint));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());

      var str = await response.stream.bytesToString();

      myservicesListModel = MyservicesListModel.fromJson(jsonDecode(str));

      var serviceList = myservicesListModel!.services;
      setState(() {
        myServiceList.addAll(serviceList!);
      });

    }
    else {
      print(response.reasonPhrase);
    }



  }

  @override
  void initState() {

    myServiceApi();
    // TODO: implement initState
    super.initState();
  }

  String _value = "Active";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.fromLTRB(0, 34, 0, 12),
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
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Select Service",
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
            hint: const Text("Select service",
              style: TextStyle(color: Color(0xff23282E), fontSize: 14),
            ),
            items: [
              for (final item in myServiceList)
                DropdownMenuItem(
                    value: item,
                    child: Text(
                      item.serviceName.toString(),
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
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Status",
                style: TextStyle(color: Color(0xff39404A), fontSize: 12), ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  value: "Active",
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
                        fontSize: 13, fontWeight: FontWeight.bold),                  ),
                  value: "New",
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
                        fontSize: 13, fontWeight: FontWeight.bold),                  ),
                  value: "Unassigned",
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
                      backgroundColor:
                       Color(0xffDFE1E4)),
                  onPressed: () {
                    widget.search("", "");
                    Navigator.of(context).pop();
                  },
                  child:const Text('Clear All',
                    style: TextStyle(
                        color: Color(0xff23282E),
                        fontSize: 13, fontWeight: FontWeight.bold),

                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color(0xff2A62B8)),
                  onPressed: () {
                    // print("valuedrop==> ${dropValue!.serviceName.toString()}");

                    widget.search(dropValue1!.serviceName.toString(), _value);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                        color: Color(0xffFBFBFC)),
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
