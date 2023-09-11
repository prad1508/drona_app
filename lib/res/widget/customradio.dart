import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? valueName;
  final T? groupValue;
  final String label;
  final Color btnColor;
  final ValueChanged<T?>
  onChanged;
  final ValueChanged<T?>?
  onChangedName;

  const CustomRadio({super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    this.valueName,
    this.onChangedName,
    required this.btnColor
  });

  Widget _labelBtn(BuildContext context) {
    final bool isSelected = value != groupValue;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: isSelected ? btnColor.withOpacity(0.1) : Colors.black),
        borderRadius: const BorderRadius.all(
            Radius.circular(10)),
        color: isSelected ? Colors.white : Colors.black,
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label.toString(),
            style: TextStyle(

                color: isSelected ? Colors.black : Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          onChanged(value);
          if (onChangedName != null){
            onChangedName!(valueName);
          }
        } ,
        splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
        child: _labelBtn(context));
  }
}
