import 'package:flutter/material.dart';
import 'package:parcial_flutter/pages/museos_page.dart';

void main() => runApp(const ParcialFlutterApp());

class ParcialFlutterApp extends StatelessWidget {
  const ParcialFlutterApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Museos del Centro',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0879D1),
        brightness: Brightness.light,
        surface: const Color(0xFFF7F9FC),
      ),
      scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      fontFamily: 'Roboto',
    ),
    home: const MuseosPage(),
  );
}
