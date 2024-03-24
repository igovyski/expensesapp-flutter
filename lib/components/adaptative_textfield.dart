import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextfield extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmited;

  const AdaptativeTextfield({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmited,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmited,
            placeholder: label,
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12,
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmited,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
