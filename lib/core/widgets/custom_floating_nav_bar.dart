import 'dart:math' as math;
import 'package:booking_system_ui/core/widgets/custom_floating_nav_bar_enum.dart';
import 'package:flutter/material.dart';

class CustomFloatingNavBar extends StatelessWidget {
  final List<FloatingNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  // الأبعاد والهوامش
  final double height;
  final double horizontalMargin;
  final double bottomMargin;
  final double borderRadius;

  // الألوان والحدود
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Color glowColor;
  final Color activeColor;
  final Color inactiveColor;

  // إعدادات الضوء / المؤشر
  final NavGlowPosition glowPosition;
  final NavGlowStyle glowStyle;
  final double glowHeight;
  final double glowWidth;
  final double indicatorLineHeight;
  final double indicatorLineWidth;
  final Duration animationDuration;

  const CustomFloatingNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.height = 64,
    this.horizontalMargin = 20,
    this.bottomMargin = 16,
    this.borderRadius = 32,
    this.backgroundColor = const Color(0xCC1E1C1A),
    this.borderColor = const Color(0x33FFFFFF),
    this.borderWidth = 1,
    this.glowColor = const Color(0xFF42F5E3),
    this.activeColor = Colors.white,
    this.inactiveColor = const Color(0xB3FFFFFF),
    this.glowPosition = NavGlowPosition.top,
    this.glowStyle = NavGlowStyle.glow,
    this.glowHeight = 28,
    this.glowWidth = 60,
    this.indicatorLineHeight = 3,
    this.indicatorLineWidth = 24,
    this.animationDuration = const Duration(milliseconds: 240),
  }) : assert(items.length >= 2, 'يجب تمرير تبويبين على الأقل');

  @override
  Widget build(BuildContext context) {
    final safeBottom = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: horizontalMargin,
        right: horizontalMargin,
        bottom: bottomMargin + (safeBottom > 0 ? safeBottom * 0.4 : 0),
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.28),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final itemWidth = totalWidth / items.length;
              final safeIndex = currentIndex.clamp(0, items.length - 1);

              final isRtl = Directionality.of(context) == TextDirection.rtl;
              final visualIndex = isRtl
                  ? (items.length - 1) - safeIndex
                  : safeIndex;

              final itemCenterX = (visualIndex * itemWidth) + (itemWidth / 2);

              final isTop = glowPosition == NavGlowPosition.top;
              final activeEffectHeight = glowStyle == NavGlowStyle.glow
                  ? glowHeight
                  : indicatorLineHeight;
              final activeEffectWidth = glowStyle == NavGlowStyle.glow
                  ? glowWidth
                  : indicatorLineWidth;

              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: animationDuration,
                    curve: Curves.easeOutCubic,
                    left: itemCenterX - (activeEffectWidth / 2),
                    top: isTop ? 0 : null,
                    bottom: isTop ? null : 0,
                    width: activeEffectWidth,
                    height: activeEffectHeight,
                    child: IgnorePointer(
                      child: glowStyle == NavGlowStyle.glow
                          ? CustomPaint(
                              size: Size(activeEffectWidth, activeEffectHeight),
                              painter: _ConeGlowPainter(
                                color: glowColor,
                                fromTop: isTop,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: glowColor,
                                borderRadius: BorderRadius.circular(99),
                                boxShadow: [
                                  BoxShadow(
                                    color: glowColor.withValues(alpha: 0.7),
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),

                  // صف التبويبات
                  Row(
                    children: List.generate(items.length, (index) {
                      final isSelected = index == safeIndex;
                      final item = items[index];
                      final contentColor = isSelected
                          ? activeColor
                          : inactiveColor;

                      final content = item.builder != null
                          ? item.builder!(context, isSelected)
                          : IconTheme(
                              data: IconThemeData(
                                color: contentColor,
                                size: 22,
                              ),
                              child: DefaultTextStyle.merge(
                                style: TextStyle(
                                  color: contentColor,
                                  fontSize: 12,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                                child: item.child,
                              ),
                            );

                      Widget tabWidget = SizedBox(
                        width: itemWidth,
                        height: height,
                        child: InkWell(
                          onTap: () => onTap(index),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Center(child: content),
                        ),
                      );

                      if (item.tooltip != null) {
                        tabWidget = Tooltip(
                          message: item.tooltip!,
                          child: tabWidget,
                        );
                      }

                      return tabWidget;
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ConeGlowPainter extends CustomPainter {
  final Color color;
  final bool fromTop;

  _ConeGlowPainter({required this.color, required this.fromTop});

  @override
  void paint(Canvas canvas, Size size) {
    // رسم شعاع مخروطي يتسع قليلاً نحو الداخل ويتلاشى تدريجياً
    final path = Path();
    if (fromTop) {
      final topHalfW = size.width * 0.24;
      final bottomHalfW = size.width * 0.5;
      final cx = size.width / 2;

      path.moveTo(cx - topHalfW, 0);
      path.lineTo(cx + topHalfW, 0);
      path.lineTo(cx + bottomHalfW, size.height);
      path.lineTo(cx - bottomHalfW, size.height);
      path.close();

      final paint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color.withValues(alpha: 0.65),
            color.withValues(alpha: 0.18),
            color.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

      canvas.drawPath(path, paint);

      final linePaint = Paint()
        ..color = color.withValues(alpha: 0.9)
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(
        Offset(cx - topHalfW, 1),
        Offset(cx + topHalfW, 1),
        linePaint,
      );
    } else {
      final bottomHalfW = size.width * 0.24;
      final topHalfW = size.width * 0.5;
      final cx = size.width / 2;

      path.moveTo(cx - topHalfW, 0);
      path.lineTo(cx + topHalfW, 0);
      path.lineTo(cx + bottomHalfW, size.height);
      path.lineTo(cx - bottomHalfW, size.height);
      path.close();

      final paint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            color.withValues(alpha: 0.65),
            color.withValues(alpha: 0.18),
            color.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

      canvas.drawPath(path, paint);

      final linePaint = Paint()
        ..color = color.withValues(alpha: 0.9)
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(
        Offset(cx - bottomHalfW, size.height - 1),
        Offset(cx + bottomHalfW, size.height - 1),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ConeGlowPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.fromTop != fromTop ||
        oldDelegate.runtimeType != runtimeType ||
        math.pi == 0;
  }
}
