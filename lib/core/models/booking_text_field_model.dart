import 'package:flutter/material.dart';

class BookingTextFieldModel {
  final String? hintText;
  final String? labelText;
  final bool keepLabelInside;

  // الألوان
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? fillColor;
  final bool? filled;

  // إعدادات البوردر والزوايا
  final bool showBorder;
  final double borderRadius;
  final double borderWidth;
  final double focusedBorderWidth;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;

  // المسافات والمدخلات
  final EdgeInsetsGeometry contentPadding;
  final bool isPassword;
  final TextInputType keyboardType;
  final int maxLines;

  const BookingTextFieldModel({
    this.hintText,
    this.labelText,
    this.keepLabelInside = true,
    this.textColor,
    this.hintColor,
    this.labelColor,
    this.fillColor,
    this.filled,
    this.showBorder = true,
    this.borderRadius = 10.0,
    this.borderWidth = 1.0,
    this.focusedBorderWidth = 1.8,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 14.0,
      vertical: 12.0,
    ),
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  bool get effectiveFilled => configOrDefaultFilled();

  bool configOrDefaultFilled() => filled ?? (fillColor != null);

  BookingTextFieldModel copyWith({
    String? hintText,
    String? labelText,
    bool? keepLabelInside,
    Color? textColor,
    Color? hintColor,
    Color? labelColor,
    Color? fillColor,
    bool? filled,
    bool? showBorder,
    double? borderRadius,
    double? borderWidth,
    double? focusedBorderWidth,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    EdgeInsetsGeometry? contentPadding,
    bool? isPassword,
    TextInputType? keyboardType,
    int? maxLines,
  }) {
    return BookingTextFieldModel(
      hintText: hintText ?? this.hintText,
      labelText: labelText ?? this.labelText,
      keepLabelInside: keepLabelInside ?? this.keepLabelInside,
      textColor: textColor ?? this.textColor,
      hintColor: hintColor ?? this.hintColor,
      labelColor: labelColor ?? this.labelColor,
      fillColor: fillColor ?? this.fillColor,
      filled: filled ?? this.filled,
      showBorder: showBorder ?? this.showBorder,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      focusedBorderWidth: focusedBorderWidth ?? this.focusedBorderWidth,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      contentPadding: contentPadding ?? this.contentPadding,
      isPassword: isPassword ?? this.isPassword,
      keyboardType: keyboardType ?? this.keyboardType,
      maxLines: maxLines ?? this.maxLines,
    );
  }
}
