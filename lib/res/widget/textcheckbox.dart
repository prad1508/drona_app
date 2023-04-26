
import 'package:flutter/material.dart';
class TextCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedFillColor;
  final Color uncheckedFillColor;
  final Color checkedTextColor;
  final Color uncheckedTextColor;
  final String title;
  const TextCheckBox(
      {Key? key,
      required this.value,
      required this.onChanged,
      this.checkedTextColor = Colors.white,
      this.checkedFillColor = Colors.black,
      this.uncheckedFillColor = const Color.fromARGB(255, 207, 207, 207),
      this.uncheckedTextColor = Colors.black,
      required this.title})
      : super(key: key);

  @override
  _TextCheckBoxState createState() => _TextCheckBoxState();
}

class _TextCheckBoxState extends State<TextCheckBox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(TextCheckBox oldWidget) {
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
    late Color fillColor;
    late Color textColor;
    late IconData iconData;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor;
        textColor = widget.checkedTextColor;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor;
        textColor = widget.uncheckedTextColor;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(width: 2, color: fillColor),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        widget.title,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.transparent),
        onPressed: () => widget.onChanged(!_checked),
        child: _buildIcon(),
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
