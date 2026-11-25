import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class CircularBox extends StatelessWidget {
  final Widget child;
  final double padding;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderWidth;

  const CircularBox({
    super.key,
    required this.child,
    this.padding = 16.0,
    this.backgroundColor = AppColors.white,
    this.borderColor,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.06),
            blurRadius: 16.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
