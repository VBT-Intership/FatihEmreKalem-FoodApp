import 'package:flutter/material.dart';
import '../utils/size.dart';
import '../utils/color.dart';

class HorizontalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: PhoneScreen(context).width * 0.30,
        child: Column(
          children: [CardImage(), cardText],
        ),
      ),
    );
  }

  Widget get cardText {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Sweets -",
              style: TextStyle(color: GRAY_TEXT, fontWeight: FontWeight.bold)),
          Text(
            "12 İtem",
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Expanded CardImage() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.theflavorbender.com/wp-content/uploads/2014/09/Simpsons-Doughnuts-4238-Copy-1.jpg"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
