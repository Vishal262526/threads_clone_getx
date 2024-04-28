import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: const Color(0xFF252526),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    snackStyle: SnackStyle.GROUNDED,
    margin: EdgeInsets.zero,
  );
}
