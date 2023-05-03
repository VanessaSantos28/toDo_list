import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
      textTheme: GoogleFonts.mandaliTextTheme(),
      primaryColor: Color(0Xffe4315a),
      primaryColorLight: Color(0xffABC8F7),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Color(0Xffe4315a))));
}