import 'package:flutter/material.dart';

class Suggestions_Feedbeak_Page extends StatelessWidget {
  const Suggestions_Feedbeak_Page({super.key});

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
          'Suggestion Or Feedback',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:
      SafeArea(child: Padding(
        padding: EdgeInsets.all(10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('Suggestion',style: TextStyle(fontFamily: 'Lato'),),
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
              heightFactor: 11,
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
      ))

    );
  }
}
