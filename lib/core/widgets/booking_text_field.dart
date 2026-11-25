import 'package:flutter/material.dart';

import '../models/booking_text_field_model.dart';

class BookingTextField extends StatelessWidget {
  final TextEditingController controller;
  final BookingTextFieldModel config;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const BookingTextField({
    super.key,
    required this.controller,
    this.config = const BookingTextFieldModel(),
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  factory BookingTextField.outlined({
    Key? key,
    required TextEditingController controller,
    required String hintText,
    String? labelText,
    bool keepLabelInside = true,
    Color? textColor,
    Color? hintColor,
    Color? labelColor,
    Color? fillColor,
    bool? filled,
    Color? borderColor,
    Color? focusedBorderColor,
    double borderWidth = 1.0,
    double focusedBorderWidth = 1.8,
    double borderRadius = 10.0,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ValueChanged<String>? onChanged,
  }) {
    return BookingTextField(
      key: key,
      controller: controller,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onChanged: onChanged,
      config: BookingTextFieldModel(
        hintText: hintText,
        labelText: labelText,
        keepLabelInside: keepLabelInside,
        textColor: textColor,
        hintColor: hintColor,
        labelColor: labelColor,
        fillColor: fillColor,
        filled: filled,
        showBorder: true,
        borderColor: borderColor,
        focusedBorderColor: focusedBorderColor,
        borderWidth: borderWidth,
        focusedBorderWidth: focusedBorderWidth,
        borderRadius: borderRadius,
        isPassword: isPassword,
        keyboardType: keyboardType,
      ),
    );
  }

  factory BookingTextField.filled({
    Key? key,
    required TextEditingController controller,
    required String hintText,
    String? labelText,
    bool keepLabelInside = true,
    Color fillColor = const Color(0xFFF4F6F9),
    Color? textColor,
    Color? hintColor,
    Color? labelColor,
    bool showBorder = false,
    Color? borderColor,
    Color? focusedBorderColor,
    double borderWidth = 1.0,
    double focusedBorderWidth = 1.8,
    double borderRadius = 12.0,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ValueChanged<String>? onChanged,
  }) {
    return BookingTextField(
      key: key,
      controller: controller,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onChanged: onChanged,
      config: BookingTextFieldModel(
        hintText: hintText,
        labelText: labelText,
        keepLabelInside: keepLabelInside,
        filled: true,
        fillColor: fillColor,
        textColor: textColor,
        hintColor: hintColor,
        labelColor: labelColor,
        showBorder: showBorder,
        borderColor: borderColor,
        focusedBorderColor: focusedBorderColor,
        borderWidth: borderWidth,
        focusedBorderWidth: focusedBorderWidth,
        borderRadius: borderRadius,
        keyboardType: keyboardType,
      ),
    );
  }

  factory BookingTextField.search({
    Key? key,
    required TextEditingController controller,
    String hintText = 'ابحث عن رحلة أو فندق...',
    String? labelText,
    Color fillColor = const Color(0xFFF1F3F5),
    Color? textColor,
    Color? hintColor,
    Color? labelColor,
    Color? borderColor,
    Color? focusedBorderColor,
    bool showBorder = false,
    double borderRadius = 24.0,
    Widget? prefixIcon = const Icon(Icons.search),
    Widget? suffixIcon,
    ValueChanged<String>? onChanged,
  }) {
    return BookingTextField(
      key: key,
      controller: controller,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onChanged: onChanged,
      config: BookingTextFieldModel(
        hintText: hintText,
        labelText: labelText,
        filled: true,
        fillColor: fillColor,
        textColor: textColor,
        hintColor: hintColor,
        labelColor: labelColor,
        showBorder: showBorder,
        borderColor: borderColor,
        focusedBorderColor: focusedBorderColor,
        borderRadius: borderRadius,
        keyboardType: TextInputType.text,
      ),
    );
  }

  InputBorder _buildBorder(
    BuildContext context, {
    required Color color,
    required double width,
  }) {
    if (!config.showBorder) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(config.borderRadius),
        borderSide: BorderSide.none,
      );
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(config.borderRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBorderColor = config.borderColor ?? theme.colorScheme.outline;
    final activeBorderColor =
        config.focusedBorderColor ?? theme.colorScheme.primary;
    final errorColor = config.errorBorderColor ?? theme.colorScheme.error;

    return TextFormField(
      controller: controller,
      obscureText: config.isPassword,
      keyboardType: config.keyboardType,
      maxLines: config.isPassword ? 1 : config.maxLines,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(
        color: config.textColor ?? theme.textTheme.bodyMedium?.color,
      ),
      decoration: InputDecoration(
        hintText: config.hintText,
        labelText: config.labelText,
        floatingLabelBehavior: config.keepLabelInside
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.auto,
        hintStyle: TextStyle(color: config.hintColor ?? theme.hintColor),
        labelStyle: TextStyle(color: config.labelColor ?? theme.hintColor),
        filled: config.effectiveFilled,
        fillColor: config.fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: config.contentPadding,
        enabledBorder: _buildBorder(
          context,
          color: defaultBorderColor,
          width: config.borderWidth,
        ),
        focusedBorder: _buildBorder(
          context,
          color: activeBorderColor,
          width: config.focusedBorderWidth,
        ),
        errorBorder: _buildBorder(
          context,
          color: errorColor,
          width: config.borderWidth,
        ),
        focusedErrorBorder: _buildBorder(
          context,
          color: errorColor,
          width: config.focusedBorderWidth,
        ),
        border: _buildBorder(
          context,
          color: defaultBorderColor,
          width: config.borderWidth,
        ),
      ),
    );
  }
}
