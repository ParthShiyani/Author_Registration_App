import 'package:author_registration_app/screens/detail_page.dart';
import 'package:author_registration_app/screens/home_page.dart';
import 'package:author_registration_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash',
        routes: {
          '/': (context) => HomePage(),
          'splash': (context) => SplashScreen(),
          'details_page': (context) => DetailsPage(),
        }),
  );
}
