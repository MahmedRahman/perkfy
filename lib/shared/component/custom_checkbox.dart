import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.title,
    this.initialValue = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 12),
      ),
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(value);
      },
      controlAffinity: ListTileControlAffinity.leading, // Place the checkbox at the start of the title
      contentPadding: EdgeInsets.zero,
      activeColor: Colors.teal,
      checkColor: Colors.white,
      subtitle: null,
    );
  }
}
