import 'package:flutter/material.dart';

class Add_Program extends StatefulWidget {
  const Add_Program({super.key});

  @override
  State<Add_Program> createState() => _Add_ProgramState();
}

bool advance = false;
bool professional = false;

class _Add_ProgramState extends State<Add_Program> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Add Program In Tennis',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
          child:
          Padding(padding: const EdgeInsetsDirectional.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const SizedBox(height: 20),
                  //Beginner Box
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(10)),
                    width: screenWidth*.95,
                    child: ExpansionTile(title:const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Beginner',style: TextStyle(fontFamily: 'Lato',fontSize: 15)),
                          Row(
                              children: [
                                Text('Fees:',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400,fontSize: 15)),
                                Text('500/M',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400,fontSize: 15)),
                              ]),
                        ]),
                      children: [
                        Padding(padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Curriculum / Program Details"),
                              const SizedBox(
                                  height: 5
                              ),
                              SizedBox(
                                height: 50,
                                width: screenWidth*.88,
                                child: TextField(

                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5),
                                      hintText: 'High-Performance Coaching',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Color(0xffDFE1E4)))),
                                ),

                              ),
                              const SizedBox(
                                  height: 10
                              ),

                              Container(
                                  height: 100,
                                  width: screenWidth*.88,
                                  decoration: BoxDecoration(border: Border.all(color: Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(10)),
                                  child:
                                  const Padding(padding: EdgeInsets.all(10),
                                    child:  Text("Abc sports management flagship course is geared for professional excellence. Players in this exclusive",
                                        style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400,fontSize: 14)),
                                  )
                              ),
                              const SizedBox(
                                  height: 10
                              ),
                              Padding(padding: EdgeInsets.only(left:10,right: 10),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Registration Fees:',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400)),
                                    Row(
                                      children: [
                                        Text('Fees:',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400)),
                                        Text('500/M',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      height: 5
                  ),
                  //Intermediate Box
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(10)),
                    width: screenWidth*.95,
                    child: ExpansionTile(title:const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Intermediate',style: TextStyle(fontFamily: 'Lato',fontSize: 15)),
                          Row(
                              children: [
                                Text('Fees:',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400,fontSize: 15)),
                                Text('500/M',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400,fontSize: 15)),
                              ]),
                        ]),
                      children: [
                        Padding(padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Curriculum / Program Details"),
                              const SizedBox(
                                  height: 5
                              ),
                              SizedBox(
                                height: 50,
                                width: screenWidth*.88,
                                child: TextField(

                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5),
                                      hintText: 'High-Performance Coaching',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                ),

                              ),
                              const SizedBox(
                                  height: 10
                              ),

                              Container(
                                  height: 100,
                                  width: screenWidth*.88,
                                  decoration: BoxDecoration(border: Border.all(color: Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(10)),
                                  child:
                                  const Padding(padding: EdgeInsets.all(10),
                                    child:  Text("Abc sports management flagship course is geared for professional excellence. Players in this exclusive",
                                        style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400,fontSize: 14)),
                                  )
                              ),
                              const SizedBox(
                                  height: 10
                              ),
                              Padding(padding: EdgeInsets.only(left:10,right: 10),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Registration Fees:',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400)),
                                    Row(
                                      children: [
                                        Text('Fees:',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400)),
                                        Text('500/M',style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.w400)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //Check Box
                  const SizedBox(
                      height: 10
                  ),
                  Row(
                    children: [
                      Checkbox(value: advance, onChanged: (value) {
                        setState(() {
                          advance = value!;
                        });
                      },),
                      Text('Advance')
                    ],
                  ),
                  const SizedBox(
                      height: 10
                  ),
                  Row(
                    children: [
                      Checkbox(value: professional, onChanged: (value) {
                        setState(() {
                          professional = value!;
                        });
                      },),
                      Text('Professional')
                    ],
                  ),
                  const SizedBox(
                      height: 50
                  ),
                  SizedBox(
                    width: screenWidth*.95,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),backgroundColor: Color(0xffDFE1E4)),
                      onPressed: () {
                        //Custom Dialog Box.
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                width: 342,
                                child:
                                AlertDialog(
                                  title: Text(
                                    "Create Custom Program",
                                    style: TextStyle(
                                        color: Colors
                                            .black,
                                        fontSize:
                                        17,
                                        fontFamily:
                                        'Lato',
                                        fontWeight:
                                        FontWeight.w600),
                                  ),

                                  content:
                                  Align(
                                    alignment:
                                    Alignment
                                        .bottomRight,
                                    child:
                                    TextButton(
                                      child:
                                      Text(
                                        "+ Add More",
                                        style: TextStyle(
                                            color: Color(
                                                0xff2A62B8),
                                            fontSize:
                                            16,
                                            fontFamily:
                                            'Lato',
                                            fontWeight:
                                            FontWeight.w700),
                                        textAlign:
                                        TextAlign.center,
                                      ),
                                      onPressed:
                                          () {},
                                    ),
                                  ),
                                  // contentPadding: EdgeInsets.all(24),
                                  actions: [
                                    SizedBox(
                                      width:
                                      135,
                                      height:
                                      48,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xffDFE1E4), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
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
                                      width:
                                      135,
                                      height:
                                      48,
                                      decoration:
                                      BoxDecoration(
                                          borderRadius: BorderRadius.circular(8)),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff2A62B8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                                          onPressed: () {},
                                          child: Text(
                                            "Save",
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
                      child: Text("Create Your Custom Page",style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  const SizedBox(
                      height: 20
                  ),
                  SizedBox(
                    width: screenWidth*.95,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),backgroundColor: Color(0xff2A62B8)),
                      onPressed: () {
                      },
                      child: Text("Continue"),
                    ),
                  ),
                ]),
          )

      ),
    );
  }
}
