import 'package:flutter/material.dart';

/// تبدیل استرینگ رنگ به Color
//گرفتن رنگ از سرور
Color hexToColor(String? hex) {
  try {
    hex = hex?.replaceAll('#', '');
    if (hex == null || hex.isEmpty) return Colors.grey;

    return Color(int.parse('FF$hex', radix: 16)); // شفافیت + رنگ
  } catch (_) {
    return Colors.grey; // رنگ پیش‌فرض
  }
}
