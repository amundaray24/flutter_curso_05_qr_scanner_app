import 'package:flutter/material.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_curso_05_qr_scanner_app/src/pages/pages.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr Scanner App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'map': (_) => const MapPage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          primarySwatch: Colors.deepPurple,
        ),
      ),
    );
  }
}