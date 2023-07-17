import 'package:flutter/material.dart';

class Issue_Query_Page extends StatelessWidget {
  Issue_Query_Page({super.key});

  List<DropdownMenuItem<String>> get dropdownCategory {
    List<DropdownMenuItem<String>> responseItem = [
      DropdownMenuItem(child: Text("Issue"), value: "Issue"),
      DropdownMenuItem(child: Text("Query"), value: "Query"),
    ];
    return responseItem;
  }
  String selectedCategory = 'Issue';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        title: Text(
          'Issue Or Query',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(child:
      Padding(padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text('Query Type',style: TextStyle(fontFamily: 'Lato'),),
          SizedBox(height: 5),
          Container(
            width: screenWidth*.95,
            height: 48,
            decoration: BoxDecoration(
              border:
              Border.all(color: Color.fromARGB(255, 188, 185, 185)),
              borderRadius: BorderRadius.all(Radius.circular(5)),

            ),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: DropdownButton<String>(
              isExpanded: true,
              elevation: 1,
              dropdownColor: const Color.fromARGB(255, 255, 255, 255),
              style: TextStyle(fontSize: 18,color: Color(0xff626D7E),fontFamily: 'Lato'),
              underline:Container() ,
              onChanged: (String? newValue) {
               setState((){
                 selectedCategory = newValue!;
               });
              },
              icon: Icon(Icons.keyboard_arrow_down_outlined),
              value:selectedCategory,
              items: dropdownCategory,
            ),
          ),
          SizedBox(height: 20),
          Text('Type Here',style: TextStyle(fontFamily: 'Lato'),),
          SizedBox(height: 5),
          Container(
            width: screenWidth*.95,
            height: 150,
            decoration: BoxDecoration(
              border:
              Border.all(color: Color.fromARGB(255, 188, 185, 185)),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextField(
              maxLines: 15,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                  border: UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 9,
            child:SizedBox(
              width: screenWidth*.95,
              height: 48,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(backgroundColor: Color(0xff2A62B8),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {

                },
                child: Text("Submit",style: TextStyle(fontFamily: 'Lato'),),
              ),
            ) ,
          )

        ],
      ),
      ),
      ),
    );
  }
}

void setState(Null Function() param0) {
}
