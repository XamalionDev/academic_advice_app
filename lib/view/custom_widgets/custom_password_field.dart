import 'package:flutter/material.dart';

import 'custom_settings.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const CustomPasswordField({
    super.key,
    required this.controller
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
      validator: validatePassword,
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