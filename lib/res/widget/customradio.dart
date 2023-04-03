import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  final Color btnColor;
  final ValueChanged<T?> onChanged;

  const CustomRadio({super.key, 
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    required this.btnColor
  });

  Widget _labelBtn(BuildContext context) {
    final bool isSelected = value == groupValue;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: isSelected ? btnColor.withOpacity(0.1) : Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(5)),
        color: isSelected ? btnColor : Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(32, 15, 32, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label.toString(),
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black, fontSize: 13),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onChanged(value),
        splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
        child: _labelBtn(context));
  }
}
