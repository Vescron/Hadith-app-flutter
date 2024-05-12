import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:hadith_app/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

final defaultColorScheme =ColorScheme.fromSwatch(
  primarySwatch: Colors.lightGreen,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme,darkColorScheme){
      return MaterialApp(
        title: 'Hadith App',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? defaultColorScheme,
            useMaterial3: true),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? defaultColorScheme,
            useMaterial3: true),
          themeMode: ThemeMode.dark, 
        home: const MainPage(),
        );
        }
    );
  }
}
