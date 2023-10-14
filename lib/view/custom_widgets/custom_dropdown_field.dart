import 'package:academic_advice_app/model/validations/forms_validation.dart';
import 'package:flutter/material.dart';

class CustomDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  final ValueNotifier<String> dropdownValue;

  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.items,
    required this.dropdownValue,
  }) : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownField222();
}

class _CustomDropdownField222 extends State<CustomDropdownField> {

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: widget.dropdownValue,
      builder: (context, String value, _) {
        return DropdownButtonFormField(
          validator: (value) {
            return validateDropdown(value);
          },
          decoration: InputDecoration(
            border: setBorder(),
            labelText: widget.label,
          ),
          value: value.isEmpty ? null : value,
          style: const TextStyle(fontWeight: FontWeight.normal),
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          onChanged: (String? newValue) {
            widget.dropdownValue.value = newValue!;
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              alignment: AlignmentDirectional.centerStart,
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}

/*class CustomDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  const CustomDropdownField({super.key, required this.label, required this.items});

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String dropdownValue = '--Seleccionar--';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        return validateDropdown(value);
      },
      decoration: InputDecoration(
        border: setBorder(),
        labelText: widget.label,
      ),
      value: dropdownValue,
      style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue.toString();
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: AlignmentDirectional.centerStart,
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}*/

