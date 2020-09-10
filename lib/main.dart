import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view/productDetail.dart';
import 'view/home/Ihome.dart';
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
        onGenerateRoute: (settings) {
          if (settings.name == "/productDetail") {
            return pageRouteBuilder(ProductDetail());
          }
          return MaterialPageRoute(builder: (context) => HomeScreenView());
        });
  }

  //page slide animate
  PageRouteBuilder pageRouteBuilder(page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
