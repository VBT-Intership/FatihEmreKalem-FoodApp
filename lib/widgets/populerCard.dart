import 'package:flutter/material.dart';
import '../utils/size.dart';
import '../utils/color.dart';
import 'populerCardTag.dart';

class PopulerCard extends StatelessWidget {
  const PopulerCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: WHITE,
        ),
        child: Row(
          children: [
            populerCardImage(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Banana Goreng",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                      PopulerCardTag(tagText1: "Gorengan", tagText2: "Makanan Ringan"),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Warung buyayuk",
                            style: TextStyle(color: GRAY_TEXT),
                          ),
                          Text(
                            "Rp. 2.500",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget populerCardImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: PhoneScreen(context).width * 0.20,
          width: PhoneScreen(context).width * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(
                  "https://www.theflavorbender.com/wp-content/uploads/2014/09/Simpsons-Doughnuts-4238-Copy-1.jpg"),
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
