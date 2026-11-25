import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class BoxWidget extends StatelessWidget {
  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final double borderWidth;
  final double? borderRadius;
  final BorderRadiusGeometry? customBorderRadius;

  const BoxWidget({
    super.key,
    required this.child,
    required this.verticalPadding,
    required this.horizontalPadding,
    this.height,
    this.color,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.customBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      height: height,
      decoration: BoxDecoration(
        color: color ?? AppColors.white,

        borderRadius:
            customBorderRadius ?? BorderRadius.circular(borderRadius ?? 16.0),

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
