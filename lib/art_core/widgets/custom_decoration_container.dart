import 'package:flutter/cupertino.dart';

import '../art_core.dart';

class CustomDecorationContainer {
  static const Color _defaultColor = Colors.white; // Assuming a default color
  static const Color _shadowColor = Colors.grey; // Assuming a shadow color
  static const double _defaultRadius = 8.0;
  static final BoxShadow _defaultBoxShadow = BoxShadow(
    color: _shadowColor.withOpacity(0.7),
    blurRadius: 3,
    offset: const Offset(1, 1),
  );

  static Decoration decoration({
    BorderRadiusGeometry borderRadius = const BorderRadius.all(Radius.circular(_defaultRadius)),
    Color color = _defaultColor,
    bool isCircle = false,
    DecorationImage? image,
    bool hasShadows = true,
    List<BoxShadow>? shadows,
    BoxBorder? border,
  }) {
    return BoxDecoration(
      image: image,
      shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      border: border,
      color: color,
      borderRadius: isCircle ? null : borderRadius,
      boxShadow: hasShadows ? shadows ?? [_defaultBoxShadow] : null,
    );
  }
}
