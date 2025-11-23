import 'package:flutter/material.dart';
import 'package:uptodo/app/theam/AppColors.dart';

import '../Text/FontText.dart';


Widget FilledButtonWidget({required BuildContext context,
  required GestureTapCallback onPressed,
  required String text,
  double? width,}
    ) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColor.primaryColor,
          width: 2,
        ),
      ),
      child: Center(
        child: FontText(
          context: context,
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.LighttextColor,
        ),
      ),
    ),
  );
}

