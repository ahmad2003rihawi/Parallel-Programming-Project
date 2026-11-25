import 'package:flutter/material.dart';

class AppColors {
  // --- الألوان الأساسية لهوية التطبيق (Brand Colors) ---
  static const Color primary = Color(
    0xffe3d8c5,
  ); // اللون الأساسي (يستخدم للأزرار الرئيسية، الأيقونات النشطة، والترويسات)
  static const Color secondary = Color(
    0xff4b5a3c,
  ); // الدرجة الفاتحة (يستخدم لحالات التحديد أو تأثيرات النقر)
  static const Color thirdColor = Color(0xffff8f3a);
  // static const Color secondary = Color(
  //   0xFF64144B,
  // ); // اللون الثانوي البنفسجي الغامق (يستخدم للنصوص البارزة أو عناصر الزينة)

  // --- الألوان المحايدة (Neutral Colors) ---
  static const Color white = Color(
    0xFFFFFFFF,
  ); // الأبيض النقي (يستخدم لخلفيات الشاشات، البطاقات، والنصوص داخل الأزرار الملونة)
  static const Color black = Color(
    0xFF000000,
  ); // الأسود النقي (يستخدم للعناوين العريضة أو الأيقونات الداكنة)
  static const Color textColor = Color(
    0xFF222222,
  ); // الأسود الباهت (يستخدم للنصوص الرئيسية ليكون مريحاً للقراءة)

  // --- تدرجات الرمادي (Greyscale) ---
  static const Color grey = Color(
    0xFFACACAC,
  ); // الرمادي العادي (يستخدم للنصوص الثانوية، التلميحات "Hints"، والأيقونات غير النشطة)
  static const Color lightGrey = Color(
    0xFFF5F5F5,
  ); // الرمادي الفاتح (يستخدم لخلفيات حقول الإدخال "TextFields" ومربعات البحث)
  static const Color borderGrey = Color(0xFFE0E0E0);
  static const Color product = Color(
    0xFFF9F3EE,
  ); // الرمادي المتوسط (يستخدم لحواف البطاقات "Borders" وخطوط الفصل)

  // --- ألوان الحالة (Status Colors) ---
  static const Color success = Color(
    0xFF4CAF50,
  ); // الأخضر (يستخدم لحالات النجاح، إكتمال الطلب، وتتبع مسار التوصيل)
  static const Color red = Color(
    0xFFFE4949,
  ); // الأحمر (يستخدم لرسائل الخطأ، أزرار الحذف، وإلغاء الطلبات)
  static const Color transparent = Colors
      .transparent; // الشفاف (يستخدم لإزالة الخلفيات أو تأثيرات التموج "Ripple")

  static const Color greyLight = Color(
    0xFFF2F2F2,
  ); // الرمادي الفاتح جداً (يستخدم للفواصل، خطوط الشبكة، وخلفيات البطاقات)
}
