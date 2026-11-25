import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final String? subtitleText;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final TextStyle? subtitleStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final BorderRadiusGeometry? customBorderRadius;
  final double? buttonHeight;
  final double? buttonWidth;
  final bool isLoading;
  final Widget? icon;
  final Color? iconBackgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? elevation;

  final bool isIconRight;
  final double iconSpace;
  final MainAxisAlignment contentAlignment;
  final CrossAxisAlignment textAlignment;

  const AppTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.subtitleText,
    this.textStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.customBorderRadius,
    this.buttonHeight,
    this.buttonWidth,
    this.isLoading = false,
    this.icon,
    this.iconBackgroundColor,
    this.padding,
    this.elevation,
    this.isIconRight = false,
    this.iconSpace = 12.0,
    this.contentAlignment = MainAxisAlignment.center,
    this.textAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        customBorderRadius ?? BorderRadius.circular(borderRadius ?? 25.0);

    final Widget buttonContent = Container(
      height: buttonHeight,
      width: buttonWidth,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: effectiveBorderRadius,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth ?? 1.0)
            : null,
      ),
      child: Row(
        mainAxisSize: buttonWidth != null ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: contentAlignment,
        children: [
          if (icon != null && isIconRight) ...[
            icon!,
            SizedBox(width: iconSpace),
          ],

          Flexible(
            child: Column(
              crossAxisAlignment: textAlignment,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  buttonText,
                  style:
                      textStyle ??
                      AppTextStyles.font16Bold.copyWith(color: AppColors.white),
                ),
                if (subtitleText != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitleText!,
                    style:
                        subtitleStyle ??
                        AppTextStyles.font12Regular.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ],
            ),
          ),

          if (icon != null && !isIconRight) ...[
            SizedBox(width: iconSpace),
            icon!,
          ],
        ],
      ),
    );

    return Material(
      color: backgroundColor ?? AppColors.primary,
      borderRadius: effectiveBorderRadius,
      elevation: elevation ?? 0.0,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: effectiveBorderRadius is BorderRadius
            ? effectiveBorderRadius as BorderRadius
            : BorderRadius.circular(25.0),
        child: isLoading
            ? SizedBox(
                height: buttonHeight ?? 52.0,
                // width: buttonWidth,
                child: const Center(
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 2.5,
                    ),
                  ),
                ),
              )
            : buttonContent,
      ),
    );
  }
}
