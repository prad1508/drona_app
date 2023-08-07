import 'package:flutter/material.dart';

class Assessment_Details_Page extends StatefulWidget {
  const Assessment_Details_Page({super.key});

  @override
  State<Assessment_Details_Page> createState() => _Assessment_Details_PageState();
}

class _Assessment_Details_PageState extends State<Assessment_Details_Page> {
  @override
  Widget build(BuildContext context) {
    //double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title:
        RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
            style:TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Lato') ,
            children: [
          TextSpan(text: 'Assessment 1\n',style: TextStyle(fontWeight: FontWeight.w700)),
           TextSpan(text: '1 Thursday, April 13, 2023',style:TextStyle(color: Colors.black, fontSize: 12,fontFamily: 'Lato'))
        ])),
        elevation: 0,
      ),
      body: SafeArea(child:
      Padding(padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Category",style: TextStyle(fontSize: 15,fontFamily: 'Lato',fontWeight: FontWeight.w700,color: Color(0xff39404A)),),
          const SizedBox(height: 10),
          SizedBox(
            width: w*.85,
            height: 25,
            child: const Text("Physical",style: TextStyle(fontSize: 15,fontFamily: 'Lato',fontWeight: FontWeight.w500,color: Color(0xff626D7E)),),
          ),
          const SizedBox(height: 15),
          const Text("Category",style: TextStyle(fontSize: 15,fontFamily: 'Lato',fontWeight: FontWeight.w700,color: Color(0xff39404A)),),
          const SizedBox(height: 10),
          SizedBox(
            width: w*.85,
            height: 45,
            child: const Text("Parameters on which you want to test the fitness of the candidate",style: TextStyle(fontSize: 15,fontFamily: 'Lato',fontWeight: FontWeight.w500,color: Color(0xff626D7E)),),
          ),
          const SizedBox(height: 15),
          const Text("Level",style: TextStyle(fontSize: 15,fontFamily: 'Lato',fontWeight: FontWeight.w700,color: Color(0xff39404A)),),
          const SizedBox(height: 10),
          Container(
            width: w*.1,
            height: 25,
            decoration: const BoxDecoration(color: Color(0xffEAEFF8)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Level : ",style: TextStyle(fontSize: 14,fontFamily: 'Lato',fontWeight: FontWeight.w400,color: Color(0xff2A62B8)),),
                Text("3",style: TextStyle(fontSize: 14,fontFamily: 'Lato',fontWeight: FontWeight.w400,color: Color(0xff2A62B8)),),
              ],
            )
          ),
          const SizedBox(height: 15),
          const Text("Coach Input",style: TextStyle(fontSize: 15,fontFamily: 'Lato',fontWeight: FontWeight.w700,color: Color(0xff39404A)),),
          const SizedBox(height: 10),
          SizedBox(
            width: w*.85,
            height: 45,
            child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",style: TextStyle(fontSize: 15,fontFamily: 'Lato',fontWeight: FontWeight.w500,color: Color(0xff626D7E)),),
          ),
          const SizedBox(height: 15),
          const Text("Attachment",style: TextStyle(fontSize: 15,fontFamily: 'Lato',fontWeight: FontWeight.w700,color: Color(0xff39404A)),),
          const SizedBox(height: 10),
          Expanded(child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5),
              child: Container(

                  child: Center(
                    child: Image.asset('assets/images/img1.png'),
                  )
              )
              ),
              Padding(padding: EdgeInsets.all(5),
                  child: Container(
                    //decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Image.asset('assets/images/img2.png'),
                    )
                  )
              ),
              Padding(padding: EdgeInsets.all(5),
                  child: Container(

                      child: Center(
                        child: Image.asset('assets/images/img3.png'),
                      )
                  )
              ),
              Padding(padding: EdgeInsets.all(5),
                  child: Container(

                      child: Center(
                        child: Image.asset('assets/images/img4.png'),
                      )
                  )
              ),
              Padding(padding: EdgeInsets.all(5),
                  child: Container(

                      child: Center(
                        child: Image.asset('assets/images/img5.png'),
                      )
                  )
              ),
              Padding(padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("Image and Video will pe added",textAlign: TextAlign.center),
                      )
                  )
              ),
              
            ],
          ))
        ],
      ),
      )
      ),
    );
  }
}
