import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Make sure to add intl package in your pubspec.yaml for date formatting

class CustomDatePicker extends StatefulWidget {
  final String label;
  final String hint;
  final ValueChanged<DateTime?> onDateSelected;

  const CustomDatePicker({
    Key? key,
    required this.label,
    this.hint = '',
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _controller.text = DateFormat('dd MMM, yyyy').format(pickedDate);
      });
      widget.onDateSelected(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: Icon(Icons.calendar_today),
            border: UnderlineInputBorder(),
          ),
          readOnly: true,
          onTap: _presentDatePicker,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '(Get 100 Point)',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
