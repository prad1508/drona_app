import 'package:flutter/material.dart';
class CustomCheckBox extends StatefulWidget {
   final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedFillColor;
  final Color uncheckedFillColor;
  final Color checkedIconColor;
  final String imageUrl;
  final String name;
  const CustomCheckBox({super.key, 
    required this.value,
    required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor = Colors.transparent, 
    this.uncheckedFillColor = Colors.white, 
    required this.imageUrl,
    required this.name
    
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
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

    switch (_status) {
      case CheckStatus.checked:
        borderColor = widget.checkedFillColor;
        break;
      case CheckStatus.unchecked:
        borderColor = widget.uncheckedFillColor;
        break;
    }

    return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 220, 220),
            border: Border.all(width: 2, color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            child: Image(
              image: NetworkImage(widget.imageUrl),
              height: 300,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: IconButton(
                iconSize: 80,
                style: const ButtonStyle(
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
                    left: 40,
                    top: 42,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: widget.checkedFillColor,
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                  )
                : Column(),
               
          ],
        ),
         Text(widget.name, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)
     
      ],
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
