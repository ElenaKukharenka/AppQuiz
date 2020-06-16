import 'package:flutter/material.dart';
import 'package:qizz_app_flutter/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Викторина',
      //цвет темы
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        //стиль текста
        textTheme: GoogleFonts.openSansCondensedTextTheme(
          //переопределяем  для всей текстовой темы наши шрифты
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    );
  }
}

