import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeText extends StatelessWidget {
  final DateTime date;
  final String format;
  final TextStyle? style;

  const TimeText({
    super.key,
    required this.date,
    this.format = 'kk:mm', // Only time (24-hour)
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
