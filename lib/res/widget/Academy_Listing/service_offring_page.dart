// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:drona/res/widget/Academy_Listing/choosefacility_page.dart';

import 'package:drona/res/widget/progress_pills.dart';

import 'package:flutter/material.dart';

class Service_Offering_Page extends StatefulWidget {
  const Service_Offering_Page({super.key});

  @override
  State<Service_Offering_Page> createState() => _Service_Offering_PageState();
}

class _Service_Offering_PageState extends State<Service_Offering_Page> {
  bool golfCheck = false;
  bool tennisCheck = false;
  bool footballdCheck = false;
  bool tabletennisCheck = false;
  bool cricketCheck = false;
  bool badmintonCheck = false;
  bool hockeyCheck = false;
  bool softballCheck = false;
  bool snookerCheck = false;
  bool boxingCheck = false;
  bool artsdCheck = false;
  bool skiingCheck = false;
  bool iceCheck = false;
  bool skatingCheck = false;
  bool bowlingCheck = false;
  bool gridironCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            ProgressPills(
                number: 5,
                active: 0,
                color: Theme.of(context).primaryColorLight),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.98,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Text(
                      "Choose Your Service Offerings",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lato',
                          color: Color(0xff39404A)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CustomCheckBox(
                            value: golfCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                golfCheck = val;
                              });
                            },
                          ),
                          Text("Golf")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: tennisCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/tennis.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                tennisCheck = val;
                              });
                            },
                          ),
                          Text("Tennis")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: footballdCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                footballdCheck = val;
                              });
                            },
                          ),
                          Text("Football")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: tabletennisCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                tabletennisCheck = val;
                              });
                            },
                          ),
                          Text("Table Tennis")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          CustomCheckBox(
                            value: cricketCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                cricketCheck = val;
                              });
                            },
                          ),
                          Text("Cricket")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: badmintonCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                badmintonCheck = val;
                              });
                            },
                          ),
                          Text("Badminton")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: hockeyCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                hockeyCheck = val;
                              });
                            },
                          ),
                          Text("Hockey")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: softballCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                softballCheck = val;
                              });
                            },
                          ),
                          Text("Softball")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          CustomCheckBox(
                            value: snookerCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                snookerCheck = val;
                              });
                            },
                          ),
                          Text("Snooker")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: boxingCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                boxingCheck = val;
                              });
                            },
                          ),
                          Text("Boxing")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: artsdCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                artsdCheck = val;
                              });
                            },
                          ),
                          Text("Martial Arts")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: skiingCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                skiingCheck = val;
                              });
                            },
                          ),
                          Text("Skiing")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          CustomCheckBox(
                            value: iceCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                iceCheck = val;
                              });
                            },
                          ),
                          Text("Ice Hockey")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: skatingCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                skatingCheck = val;
                              });
                            },
                          ),
                          Text("Ice Skating")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: bowlingCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                bowlingCheck = val;
                              });
                            },
                          ),
                          Text("Bowling")
                        ],
                      ),
                      Column(
                        children: [
                          CustomCheckBox(
                            value: gridironCheck,
                            checkedFillColor: Color(0xff2A62B8),
                            imageUrl: 'assets/images/Golf.png',
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                gridironCheck = val;
                              });
                            },
                          ),
                          Text("Gridiron")
                        ],
                      ),
                    ],
                  ),
                  Align(
                    heightFactor: 8,
                    child: Center(
                      child: SizedBox(
                        width: 342,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: Color(0xff2A62B8)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChooseFacilityPage()),
                              );
                            },
                            child: const Text(
                              "Continue",
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Lato'),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//above code use build context
//get respose in value
class CustomCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedFillColor;
  final Color uncheckedFillColor;
  final Color checkedIconColor;
  final String imageUrl;
  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor = Colors.teal,
    this.uncheckedFillColor = Colors.white,
    required String this.imageUrl,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color borderColor;
    late Color iconColor;
    late IconData iconData;

    switch (_status) {
      case CheckStatus.checked:
        borderColor = widget.checkedFillColor;
        iconColor = widget.checkedIconColor;
        break;
      case CheckStatus.unchecked:
        borderColor = widget.uncheckedFillColor;
        break;
    }

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 222, 220, 220),
        border: Border.all(width: 2, color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        child: Image(
          image: AssetImage(widget.imageUrl),
          height: 300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: IconButton(
            iconSize: 80,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.transparent),
              iconColor: MaterialStatePropertyAll<Color>(Colors.transparent),
            ),
            icon: _buildIcon(),
            onPressed: () => widget.onChanged(!_checked),
          ),
        ),
        _status == CheckStatus.checked
            ? Positioned(
                left: 64,
                top: 64,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: widget.checkedFillColor,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15.0,
                  ),
                ),
              )
            : Column()
      ],
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
