import 'package:academic_advice_app/model/validations/forms_validation.dart';
import 'package:academic_advice_app/view/design_functions/design_functions.dart';
import 'package:flutter/material.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const CustomPhoneField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      validator: validatePhoneNumber,
      decoration: InputDecoration(
          labelText: widget.label,
          border: setBorder()
      ),
    );
  }
}