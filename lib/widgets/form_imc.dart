// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names
import 'package:flutter/material.dart';

class FormImc extends StatelessWidget {
  final String nameInput;
  final String placeholder;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const FormImc({
    Key? key,
    required this.nameInput,
    required this.placeholder,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(nameInput),
          hintText: placeholder,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: validator,
      ),
    );
  }
}
