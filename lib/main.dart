import 'package:flutter/material.dart';
import 'file:///C:/Users/blackbj4/AndroidStudioProjects/coco2/lib/screens/top_fits.dart';
import 'package:coco2/screens/home_screen.dart';
import 'package:coco2/screens/search_page.dart';
import 'package:coco2/screens/settings_page.dart';
import 'package:coco2/screens/welcome_screen.dart';
import 'package:coco2/screens/registration_screen.dart';
import 'package:coco2/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'welcome_screen',
      routes: {
        '0': (context) => HomeScreen(),
        '1': (context) => TopFits(),
        '2': (context) => SearchPage(),
        '3': (context) => SettingsPage(),

        'welcome_screen': (context) => WelcomeScreen(),
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen()
      }
    );
  }
}
