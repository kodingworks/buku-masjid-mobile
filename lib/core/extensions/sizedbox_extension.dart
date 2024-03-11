import 'package:flutter/material.dart';

/// Extension for creating SizedBox with specified dimensions.
extension SizedBoxExtension on double {
  /// Creates a SizedBox with specified width.
  SizedBox get width => SizedBox(width: this);

  /// Creates a SizedBox with specified height.
  SizedBox get height => SizedBox(height: this);

  /// Creates a SizedBox with specified width and height, both equal to this value.
  SizedBox get box => SizedBox(height: this, width: this);
}
