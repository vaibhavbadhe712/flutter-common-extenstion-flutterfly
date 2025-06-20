import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  /// Adds padding to widget
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  /// Adds margin to widget
  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );

  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      Container(
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Container(
        margin:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  /// Centers the widget
  Widget get center => Center(child: this);

  /// Expands the widget
  Widget get expanded => Expanded(child: this);

  /// Flexible widget
  Widget flexible({int flex = 1}) => Flexible(flex: flex, child: this);

  /// Adds gesture detector
  Widget onTap(VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );

  /// Adds InkWell
  Widget inkWell({VoidCallback? onTap}) => InkWell(
        onTap: onTap,
        child: this,
      );

  /// Adds card wrapper
  Widget card({
    double elevation = 4,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) =>
      Card(
        elevation: elevation,
        margin: margin,
        child: padding != null ? Padding(padding: padding, child: this) : this,
      );

  /// Adds container wrapper
  Widget container({
    double? width,
    double? height,
    Color? color,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    Border? border,
  }) =>
      Container(
        width: width,
        height: height,
        color: color,
        padding: padding,
        margin: margin,
        decoration: borderRadius != null || border != null
            ? BoxDecoration(
                color: color,
                borderRadius: borderRadius,
                border: border,
              )
            : null,
        child: this,
      );

  /// Makes widget circular
  Widget get circular => ClipOval(child: this);

  /// Adds border radius
  Widget borderRadius(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );

  /// Adds opacity
  Widget opacity(double opacity) => Opacity(
        opacity: opacity,
        child: this,
      );

  /// Adds rotation
  Widget rotate(double angle) => Transform.rotate(
        angle: angle,
        child: this,
      );

  /// Adds scale
  Widget scale(double scale) => Transform.scale(
        scale: scale,
        child: this,
      );

  /// Adds visibility
  Widget visible(bool isVisible) => Visibility(
        visible: isVisible,
        child: this,
      );

  /// Adds tooltip
  Widget tooltip(String message) => Tooltip(
        message: message,
        child: this,
      );

  /// Adds hero animation
  Widget hero(String tag) => Hero(
        tag: tag,
        child: this,
      );

  /// Adds positioned widget
  Widget positioned({
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) =>
      Positioned(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        child: this,
      );

  /// Adds alignment
  Widget align(Alignment alignment) => Align(
        alignment: alignment,
        child: this,
      );

  /// Adds safe area
  Widget get safeArea => SafeArea(child: this);

  /// Adds single child scroll view
  Widget get scrollable => SingleChildScrollView(child: this);
}
