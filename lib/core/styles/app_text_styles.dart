import 'package:flutter/material.dart';
import '../../gen/fonts.gen.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const String _fontFamily = FontFamily.dINNext;

  // --- الخط العريض (Bold - FontWeight.w700) ---
  /// يُستخدم للعناوين الرئيسية الكبيرة جداً
  static const TextStyle font26Bold = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.primary,
  );

  /// يُستخدم لعناوين الشاشات والأقسام الرئيسية
  static const TextStyle font20BoldBlack = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );
  static const TextStyle font18BoldPrimary = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.primary,
  );

  /// يُستخدم لنصوص الأزرار الرئيسية والعناوين الفرعية
  static const TextStyle font18Bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );

  /// يُستخدم لأسماء المنتجات والعناوين داخل البطاقات (Cards)
  static const TextStyle font16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );

  /// يُستخدم للأسعار والوسوم البارزة (Badges/Tags)
  static const TextStyle font14Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );

  /// يُستخدم للنصوص الصغيرة البارزة (مثل شارات الخصم)
  static const TextStyle font12Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );

  // --- الخط المتوسط (Medium - FontWeight.w500) ---
  /// يُستخدم لعناوين حقول الإدخال وقوائم الخيارات
  static const TextStyle font18Medium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );
  static const TextStyle font18MediumPrimary = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.primary,
  );

  /// يُستخدم لنصوص الأزرار الثانوية وعناصر القوائم
  static const TextStyle font16MediumBlack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );
  static const TextStyle font14MediumWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.white,
  );
  static const TextStyle font14MediumPrimary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.primary,
  );

  static const TextStyle font16Regulargrey = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.grey,
  );

  /// يُستخدم لنصوص التبويبات (Tabs) والعناوين الفرعية الصغيرة
  static const TextStyle font14Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );

  /// يُستخدم للتسميات التوضيحية البارزة
  static const TextStyle font12Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );

  // --- الخط العادي (Regular - FontWeight.w400) ---
  /// يُستخدم للنصوص التوضيحية الطويلة والمقالات
  static const TextStyle font16RegularTextcolor = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );

  /// يُستخدم للنصوص الأساسية داخل التطبيق ووصف المنتجات
  static const TextStyle font14Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.textColor,
  );
  static const TextStyle font14RegularPrimary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.primary,
  );
  static const TextStyle font14RegularRed = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.red,
  );

  /// يُستخدم لتلميحات حقول الإدخال (Hint Text) والنصوص الثانوية
  static const TextStyle font12Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.grey,
  );
  static const TextStyle font12RegularPrimary = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.primary,
  );

  /// يُستخدم للتفاصيل الدقيقة مثل التواريخ والأرقام المرجعية
  static const TextStyle font10Regular = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.grey,
  );
}
