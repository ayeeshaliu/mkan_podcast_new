import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final materialTheme = ThemeData(
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: Color(0xff127EFB),
  ),
  primarySwatch: Colors.green,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.all(16.0.h)),
      foregroundColor: MaterialStateProperty.all(const Color(0xFF3DDC84)),
    ),
  ),
);