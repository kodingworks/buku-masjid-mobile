import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Class representing an adaptive theme containing various text styles and colors.
class AdaptiveTheme extends Equatable {
  const AdaptiveTheme({required this.themeData});

  /// The theme data containing text styles and colors.
  final ThemeData themeData;

  // Text Style

  /// Get the heading text style from the theme data.
  TextStyle? get headingTextStyle => themeData.textTheme.headlineMedium;

  /// Get the title text style from the theme data.
  TextStyle? get titleTextStyle => themeData.textTheme.titleLarge;

  /// Get the subtitle text style from the theme data.
  TextStyle? get subTitleTextStyle => themeData.textTheme.titleMedium;

  /// Get the label text style from the theme data.
  TextStyle? get labelTextStyle => themeData.textTheme.bodyLarge;

  /// Get the regular text style from the theme data.
  TextStyle? get regularTextStyle => themeData.textTheme.bodyMedium;

  /// Get the caption text style from the theme data.
  TextStyle? get captionTextStyle => themeData.textTheme.bodySmall;

  /// Get the button text style from the theme data.
  TextStyle? get buttonTextStyle => themeData.textTheme.labelLarge;

  // Color

  /// Get the primary color from the theme data.
  Color get primaryColor => themeData.colorScheme.primary;

  /// Get the background color from the theme data.
  Color get backgroundColor => themeData.scaffoldBackgroundColor;

  /// Get the disabled color from the theme data.
  Color get disabledColor => themeData.disabledColor;

  /// Get the tertiary color from the theme data.
  Color get tertiaryColor => themeData.dividerColor;

  // Text Color

  /// Get the solid text color from the title text style.
  Color? get solidTextColor => titleTextStyle?.color;

  /// Get the regular text color from the regular text style.
  Color? get regularTextColor => regularTextStyle?.color;

  /// Get the tertiary text color from the regular text style.
  Color? get tertiaryTextColor => regularTextStyle?.color;

  /// Get the placeholder text color from the hint style of input decoration.
  Color? get placeholderTextColor =>
      themeData.inputDecorationTheme.hintStyle?.color;

  @override
  List<Object?> get props => [themeData];
}
