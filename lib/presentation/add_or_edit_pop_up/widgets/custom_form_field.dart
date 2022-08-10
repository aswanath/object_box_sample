import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboard;

  const TextFieldCustom({
    Key? key,
    required this.labelText,
    this.keyboard,
    this.controller,
    this.initialValue,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboard ?? TextInputType.text,
      onChanged: onChanged,
      validator: validator,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
        labelStyle: const TextStyle(color: Colors.blueGrey),
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.purple), borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.purple), borderRadius: BorderRadius.circular(15)),
      ),
      controller: controller,
    );
  }
}
