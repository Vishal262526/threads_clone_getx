import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:threads_clone/utils/type_def.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isSecureEntry;
  final ValidatorCallBack validatorCallBack;

  const AuthInput({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.validatorCallBack,
    this.keyboardType = TextInputType.text,
    this.isSecureEntry = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validatorCallBack,
      obscureText: isSecureEntry,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        label: Text(label),
        hintText: hintText,
      ),
    );
  }
}
