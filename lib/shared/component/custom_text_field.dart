import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String initialValue;
  final Function(String) onChanged;
  final Color borderColor;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextEditingController? controller; // Add this line

  const CustomTextField({
    Key? key,
    required this.label,
    this.initialValue = '',
    required this.onChanged,
    this.borderColor = Colors.cyan,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isPassword = false,
    this.controller, // Add this line
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor, width: 3),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      cursorColor: widget.borderColor,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
    );
  }
}
