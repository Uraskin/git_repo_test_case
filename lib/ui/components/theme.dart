import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        assert(data != null),
        super(key: key, child: child);

  final AppThemeData data;

  @override
  bool updateShouldNotify(AppTheme oldWidget) => data != oldWidget.data;

  static AppThemeData of(BuildContext context) {
    final AppTheme theme = context.dependOnInheritedWidgetOfExactType();
    return theme?.data ?? const AppThemeData();
  }
}

class AppThemeData {
  Color get primaryBlackColor => Color(0xFF440464C);
  Color get borderDividerColor => Color(0xFF606163);
  Color get accentColor => Color(0xFFDA5289);
  Color get listItemBackground => Color(0xFFEDF4F8);
  Color get avatarPlaceholderColor => Color(0xFF335469);
  Color get whiteColor => Color(0xFFFFFFFF);
  Color get primaryTextColor => Color(0xFF440464C);
  Color get secondaryTextColor => Color(0xFF606163);
  Color get inputPlaceholderTextColor => Color(0xFFC1C1C1);
  Color get redColor => Color(0xFFD33434);
  Color get inputTextColor => Color(0xFF545353);

  TextStyle get toolbarTextStyle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      );

  TextStyle get primaryTextStyle => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: primaryTextColor,
      );

  TextStyle get secondaryTextStyle => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondaryTextColor,
      );

  TextStyle get inputPlaceholderTextStyle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: inputPlaceholderTextColor,
      );

  TextStyle get buttonTextStyle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      );

  TextStyle get inputAllFieldTextStyle => TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: inputTextColor,
        decoration: TextDecoration.none
        
      );

  TargetPlatform get platform => defaultTargetPlatform;

  const AppThemeData();
}
