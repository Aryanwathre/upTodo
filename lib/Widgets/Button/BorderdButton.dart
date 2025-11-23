import 'package:flutter/material.dart';
import 'package:uptodo/app/theam/AppColors.dart';

import '../Text/FontText.dart';


Widget BorderedButtonWidget(
    BuildContext context,
    GestureTapCallback onPressed,
    String text,
    ) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.primaryColor,
            width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: FontText(
          context: context,
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}