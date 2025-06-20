import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  /// Creates a SizedBox with height
  SizedBox get height => SizedBox(height: toDouble());

  /// Creates a SizedBox with width
  SizedBox get width => SizedBox(width: toDouble());

  /// Creates a SizedBox with both height and width
  SizedBox get box => SizedBox(height: toDouble(), width: toDouble());

  /// Creates horizontal space
  Widget get horizontalSpace => SizedBox(width: toDouble());

  /// Creates vertical space
  Widget get verticalSpace => SizedBox(height: toDouble());
}

extension IntSizedBoxExtension on int {
  SizedBox toHeight() {
    return SizedBox(height: toDouble());
  }

  SizedBox toWidth() {
    return SizedBox(width: toDouble());
  }

  SizedBox toBox() {
    return SizedBox(height: toDouble(), width: toDouble());
  }
}

// Padding Extensions
extension PaddingExtension on num {
  EdgeInsets get padding => EdgeInsets.all(toDouble());
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());
}

// Margin Extensions
extension MarginExtension on num {
  EdgeInsets get margin => EdgeInsets.all(toDouble());
  EdgeInsets get marginHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get marginTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get marginBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get marginLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get marginRight => EdgeInsets.only(right: toDouble());
}

// Border Radius Extensions
extension BorderRadiusExtension on num {
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());
  BorderRadius get topRadius => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get bottomRadius => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );
  BorderRadius get leftRadius => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        bottomLeft: Radius.circular(toDouble()),
      );
  BorderRadius get rightRadius => BorderRadius.only(
        topRight: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );
}
