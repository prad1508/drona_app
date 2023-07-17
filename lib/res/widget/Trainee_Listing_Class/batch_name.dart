import 'package:flutter/material.dart';

class Batch_DropDown extends StatefulWidget {
  const Batch_DropDown({super.key});

  @override
  State<Batch_DropDown> createState() => _Batch_DropDownState();
}

class _Batch_DropDownState extends State<Batch_DropDown> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Select Batch Name"), value: "Select Batch Name"),
      DropdownMenuItem(child: Text("Football"), value: "Football"),
      DropdownMenuItem(child: Text("Tennis"), value: "Tennis"),
      DropdownMenuItem(child: Text("Cricket"), value: "Cricket"),
      DropdownMenuItem(child: Text("Badminton"), value: "Badminton"),
    ];
    return menuItems;
  }

  String selectedValue = "Select Batch Name";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
              width: 342,
              height: 48,
              child: InputDecorator(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        icon: Icon(Icons.expand_more, size: Checkbox.width),
                        isExpanded: true,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                  ))),
        ],
      ),
    );
  }
}
