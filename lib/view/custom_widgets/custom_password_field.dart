import 'package:academic_advice_app/model/validations/forms_validation.dart';
import 'package:academic_advice_app/view/design_functions/design_functions.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool validate;
  const CustomPasswordField({
    super.key,
    required this.controller, required this.validate
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validate ? validatePassword : validateInput,
      decoration: InputDecoration(
          labelText: 'Contraseña',
          border: setBorder(),
          suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility))
      ),
      obscureText: showPassword,
    );
  }
}