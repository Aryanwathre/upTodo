import 'package:flutter/material.dart';
import 'package:uptodo/Widgets/Text/FontText.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hint: FontText(context: context, text: label, textAlign: TextAlign.start),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
