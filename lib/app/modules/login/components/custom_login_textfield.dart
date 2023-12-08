import 'package:flutter/material.dart';

InputDecoration getLoginInputDecoration(String label, Icon prefixIcon) {
  return InputDecoration(
    prefixIcon: prefixIcon,
    hintText: label,
    fillColor: Colors.grey[300],
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
