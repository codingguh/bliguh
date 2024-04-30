import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/theme/custom_themes/appbar_theme.dart';
import 'package:bliguh/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:bliguh/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:bliguh/utils/theme/custom_themes/chip_theme.dart';
import 'package:bliguh/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:bliguh/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:bliguh/utils/theme/custom_themes/text_field_theme.dart';
import 'package:bliguh/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
