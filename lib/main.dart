import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home.dart';
import 'screens/productDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      title: "FoodApp",
      home: ProductDetail(),
      // home: HomeScreen(),
    );
  }
}
