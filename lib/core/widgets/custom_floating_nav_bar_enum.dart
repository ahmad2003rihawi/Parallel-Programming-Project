import 'package:flutter/material.dart';

enum NavGlowPosition { top, bottom }

enum NavGlowStyle { glow, line }

class FloatingNavItem {
  final Widget child;

  final Widget Function(BuildContext context, bool isSelected)? builder;

  final String? tooltip;

  const FloatingNavItem({required this.child, this.builder, this.tooltip});
}
