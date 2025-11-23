import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateText extends StatelessWidget {
  final DateTime date;
  final String format;
  final TextStyle? style;

  const DateText({
    super.key,
    required this.date,
    this.format = 'yyyy-MM-dd', // Only date
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat(format).format(date),
      style: style ??
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}
