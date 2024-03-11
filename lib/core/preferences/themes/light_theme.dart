import 'package:buku_masjid/app/config.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:flutter/material.dart';

class LightTheme {
  LightTheme(this.primaryColor);

  final Color primaryColor;
  static Color disabledTextColor = AppColors.black[500]!;
  static Color secondaryColor = AppColors.orange;
  static Color disabledColor = AppColors.black[500]!;
  static Color textSolidColor = AppColors.black;
  static Color errorColor = AppColors.red;
  static Color dividerColor = AppColors.black[100]!;
  static Color inputBackgroundColor = AppColors.gray[100]!;
  static Color scaffoldColor = AppColors.gray[100]!;
  static Color cardColor = AppColors.gray[100]!;
  static Color appBarColor = AppColors.gray[100]!;

  ColorScheme get scheme => ColorScheme.light(
        primary: primaryColor,
        surface: primaryColor,
        secondary: secondaryColor,
      );

  ButtonThemeData get button => ButtonThemeData(
        buttonColor: primaryColor,
        disabledColor: disabledTextColor,
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dp8,
          horizontal: Dimens.dp24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
      );

  OutlinedButtonThemeData get outlineButton => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp50),
          ),
          padding: const EdgeInsets.all(Dimens.defaultPadding),
          textStyle: text.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      );

  ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: scaffoldColor,
          backgroundColor: primaryColor,
          disabledBackgroundColor: dividerColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp50),
          ),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.all(Dimens.defaultPadding),
          textStyle: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      );

  TextButtonThemeData get textButton => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp12),
          ),
        ),
      );

  CardTheme get card => CardTheme(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp16),
          side: BorderSide(color: disabledColor),
        ),
        color: cardColor,
      );

  AppBarTheme get appBar => AppBarTheme(
        color: scaffoldColor,
        titleTextStyle: text.titleLarge?.copyWith(
          color: textSolidColor,
          fontSize: Dimens.dp18,
        ),
        toolbarTextStyle: text.titleLarge?.copyWith(
          color: textSolidColor,
          fontSize: Dimens.dp18,
        ),
        surfaceTintColor: appBarColor,
        elevation: .3,
        shadowColor: dividerColor.withOpacity(0.3),
        iconTheme: IconThemeData(
          color: AppColors.black[300],
          size: Dimens.dp24,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.black[300],
          size: Dimens.dp24,
        ),
      );

  InputDecorationTheme get inputDecoration => InputDecorationTheme(
        filled: true,
        fillColor: inputBackgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: Dimens.dp14,
          horizontal: Dimens.defaultPadding,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: dividerColor),
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: dividerColor),
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: dividerColor),
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
      );

  BottomNavigationBarThemeData get bottomNav => BottomNavigationBarThemeData(
        backgroundColor: cardColor,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: dividerColor,
        selectedLabelStyle: TextStyle(
          fontSize: Dimens.dp10,
          fontFamily: AppConfig.fontFamily,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: Dimens.dp10,
          fontFamily: AppConfig.fontFamily,
          color: dividerColor,
        ),
      );

  TabBarTheme get tabBar => TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: primaryColor,
            width: Dimens.dp2,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: primaryColor,
        unselectedLabelColor: disabledTextColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: AppConfig.fontFamily,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: AppConfig.fontFamily,
        ),
      );

  TextTheme get text => TextTheme(
        bodyLarge: TextStyle(
          color: textSolidColor,
          fontSize: Dimens.dp16,
          fontWeight: FontWeight.w600,
          fontFamily: AppConfig.fontFamily,
        ),
        bodyMedium: TextStyle(
          color: disabledTextColor,
          fontSize: Dimens.dp14,
          fontFamily: AppConfig.fontFamily,
        ),
        headlineLarge: TextStyle(
          color: textSolidColor,
          fontWeight: FontWeight.w700,
          fontSize: Dimens.dp36,
          fontFamily: AppConfig.fontFamily,
        ),
        // Use for heading text
        headlineMedium: TextStyle(
          color: textSolidColor,
          fontWeight: FontWeight.w700,
          fontSize: Dimens.dp28,
          fontFamily: AppConfig.fontFamily,
        ),
        headlineSmall: TextStyle(
          color: textSolidColor,
          fontWeight: FontWeight.w600,
          fontSize: Dimens.dp24,
          fontFamily: AppConfig.fontFamily,
        ),
        // Use for title text, AppBar
        titleLarge: TextStyle(
          color: textSolidColor,
          fontWeight: FontWeight.w600,
          fontSize: Dimens.dp20,
          fontFamily: AppConfig.fontFamily,
        ),
        // Use for sub title text
        titleMedium: TextStyle(
          color: textSolidColor,
          fontWeight: FontWeight.w700,
          fontSize: Dimens.dp16,
          fontFamily: AppConfig.fontFamily,
        ),

        // Use for regular text
        labelLarge: TextStyle(
          fontSize: Dimens.dp12,
          fontFamily: AppConfig.fontFamily,
          fontWeight: FontWeight.w400,
          color: disabledTextColor,
        ),
        // Use for caption & smaall text
        bodySmall: TextStyle(
          fontSize: Dimens.dp10,
          fontFamily: AppConfig.fontFamily,
          color: disabledTextColor,
        ),
        labelSmall: TextStyle(
          fontSize: Dimens.dp8,
          fontFamily: AppConfig.fontFamily,
          fontWeight: FontWeight.w400,
          color: textSolidColor,
        ),
      );

  FloatingActionButtonThemeData get floatingButton =>
      FloatingActionButtonThemeData(
        backgroundColor: scaffoldColor,
        elevation: 2,
        foregroundColor: textSolidColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp100),
        ),
      );

  BottomSheetThemeData get bottomSheet => BottomSheetThemeData(
        backgroundColor: scaffoldColor,
        surfaceTintColor: scaffoldColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimens.dp12),
          ),
        ),
      );

  DividerThemeData get divider => DividerThemeData(
        color: inputBackgroundColor,
        thickness: 8,
      );

  BottomAppBarTheme get bottomAppBarTheme => BottomAppBarTheme(
        color: scaffoldColor,
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
      );

  ListTileThemeData get listTileTheme => const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: Dimens.defaultPadding,
          vertical: Dimens.dp4,
        ),
      );

  DatePickerThemeData get datePickerTheme => DatePickerThemeData(
        backgroundColor: scaffoldColor,
        surfaceTintColor: scaffoldColor,
        dividerColor: dividerColor.withOpacity(.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp12),
        ),
        headerForegroundColor: textSolidColor,
        weekdayStyle: text.bodyMedium?.copyWith(color: textSolidColor),
        dayStyle: text.bodyMedium?.copyWith(color: textSolidColor),
      );

  TimePickerThemeData get timePickerTheme => TimePickerThemeData(
        backgroundColor: scaffoldColor,
        dialBackgroundColor: scaffoldColor,
        hourMinuteColor: scaffoldColor,
        hourMinuteTextColor: disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp12),
        ),
      );

  ThemeData get toTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppConfig.fontFamily,
      bottomAppBarTheme: bottomAppBarTheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldColor,
      canvasColor: scaffoldColor,
      disabledColor: disabledColor,
      textTheme: text,
      cardTheme: card,
      appBarTheme: appBar,
      dividerColor: dividerColor,
      unselectedWidgetColor: disabledColor,
      buttonTheme: button,
      inputDecorationTheme: inputDecoration,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      outlinedButtonTheme: outlineButton,
      elevatedButtonTheme: elevatedButton,
      textButtonTheme: textButton,
      listTileTheme: listTileTheme,
      bottomNavigationBarTheme: bottomNav,
      tabBarTheme: tabBar,
      floatingActionButtonTheme: floatingButton,
      bottomSheetTheme: bottomSheet,
      dividerTheme: divider,
      cardColor: cardColor,
      datePickerTheme: datePickerTheme,
      timePickerTheme: timePickerTheme,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: dividerColor,
        selectionHandleColor: primaryColor,
      ),
      colorScheme: scheme.copyWith(error: errorColor),
    );
  }
}
