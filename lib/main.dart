import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lawyer/Views/sponsors.dart';

import 'Views/contactUs.dart';
import 'Views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
        Locale('en', 'EN'),
      ],
      locale: Locale('ar', 'AE'),
      title: 'Lawyer',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
      routes: {
        '/sponsors': (context) => Sponsors(),
        '/contact': (context) => ContactUs(),
      },
    );
  }
}
