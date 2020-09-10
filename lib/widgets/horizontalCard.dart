import 'package:flutter/material.dart';
import 'package:foodApp/model/sweetModel.dart';
import '../utils/size.dart';
import '../utils/color.dart';

class HorizontalCard extends StatelessWidget {
  final SweetModel sweet;

  const HorizontalCard({this.sweet});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/productDetail', arguments: sweet);
        },
        child: Container(
          width: PhoneScreen(context).width * 0.30,
          child: Column(
            children: [
              cardImage,
              cardText,
            ],
          ),
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
          cardTitle,
          cardItemText,
        ],
      ),
    );
  }

  Text get cardTitle {
    return Text("${sweet.name} -",
        style: TextStyle(color: GRAY_TEXT, fontWeight: FontWeight.bold));
  }

  Text get cardItemText {
    return Text(
      "${sweet.item} İtem",
      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
    );
  }

  Expanded get cardImage {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: networkImage, fit: BoxFit.cover),
        ),
      ),
    );
  }

  NetworkImage get networkImage {
    return NetworkImage(sweet.image[0]);
  }
}
