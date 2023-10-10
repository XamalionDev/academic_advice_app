import 'package:academic_advice_app/model/validations/forms_validation.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final bool empty;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.inputType,
    required this.empty
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      validator: widget.empty ? null : validateInput,
      decoration: InputDecoration(
        labelText: widget.label,
        border: setBorder()
      ),
    );
  }
}
