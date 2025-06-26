import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.buttonName,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  final VoidCallback? onTap;
  final String? buttonName;
  final Color? backgroundColor, textColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: backgroundColor ??  AppConstants.KmianColor,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null
              ? Border.all(color: borderColor!)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          buttonName ?? '',
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
