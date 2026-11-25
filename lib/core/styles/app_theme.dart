import 'package:flutter/material.dart';
import '../../gen/fonts.gen.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

abstract class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: FontFamily.dINNext,
      scaffoldBackgroundColor: AppColors.primary,
      primaryColor: AppColors.secondary,

      // --- نظام تدرج الألوان (Color Scheme) ---
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.white,
        error: AppColors.red,
      ),

      // --- شريط العنوان العلوي (AppBar Theme) ---
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: AppTextStyles.font18Bold,
      ),

      // --- الأزرار العريضة الأساسية (ElevatedButton Theme) ---
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyles.font16Bold,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
      ),

      // --- حقول الإدخال والبحث (InputDecoration Theme) ---
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        hintStyle: AppTextStyles.font14Regular.copyWith(color: AppColors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),

        // الحدود الافتراضية
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderGrey, width: 1),
        ),
        // عند عدم التركيز على الحقل
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderGrey, width: 1),
        ),
        // عند النقر على الحقل للكتابة
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        // عند حدوث خطأ في الإدخال
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.red, width: 1),
        ),
      ),
    );
  }
}
