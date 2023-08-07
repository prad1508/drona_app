import 'package:drona/view/performance/widgets/confirmAddedCategoryBox.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
                style:TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Lato') ,
                children: [
                  TextSpan(text: 'Assessment 1\n',style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text: '1 Thursday, April 13, 2023',style:TextStyle(color: Colors.black, fontSize: 12,fontFamily: 'Lato'))
                ])),
        actions: [Padding(padding: const EdgeInsets.only(right: 5),
          child: IconButton(onPressed: () {

          }, icon: const Icon(Icons.add)),
        )],
        elevation: 0,
      ),
      body:  SafeArea(child:
      Column(
        children: [
          ConfirmBoxes(category: 'Physical', level: 3, description: 'Parameters on which you want to test the fitness of the candidate'),
          ConfirmBoxes(category: 'Technical - Batting', level: 3, description: 'Techniques/movements on which you want to assess the candidate'),
          ConfirmBoxes(category: 'Technical - Bowling', level: 3, description: 'Techniques/movements on which you want to assess the candidate'),
          ConfirmBoxes(category: 'Technical - Fielding', level: 3, description: 'Techniques/movements on which you want to assess the candidate'),
          ConfirmBoxes(category: 'Technical - Wicket keeping', level: 3, description: 'Techniques/movements on which you want to assess the candidate'),
          ConfirmBoxes(category: 'Tactical', level: 3, description: 'Parameters on which you want to assess all the strategies and action taken by a candidate'),
          ConfirmBoxes(category: 'Discipline', level: 3, description: 'Parameters on which you want to assess the sporting attitude of candidate'),
        ],
      )
      ),
    );
  }
}
