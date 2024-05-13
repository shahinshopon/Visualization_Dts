import 'package:dts_visu_frontend/const/app_colors.dart';
import 'package:flutter/material.dart';


const normalText = TextStyle(fontSize: 20, color: lightColor);
const fontTitle = TextStyle(fontSize: 25, color: lightColor);

failedSnackBar({
  context,
    required String message,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 2), content: Text(message),
    ));
  }