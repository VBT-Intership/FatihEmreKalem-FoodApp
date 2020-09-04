import 'package:flutter/material.dart';
import '../utils/color.dart';
import '../utils/size.dart';
import 'package:dotted_border/dotted_border.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_GRAY,
      appBar: AppBar(
        backgroundColor: TRANSPARENT,
        elevation: 0,
        leading: Icon(Icons.chevron_left, color: LIGHT_BLACK),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.favorite,
              color: LIGHT_BLACK,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            productImageList(context),
            productAbout(),
            productBuyArea()
          ],
        ),
      ),
    );
  }

  Expanded productImageList(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        width: double.infinity,
        child: list(context),
      ),
    );
  }

  Widget list(context) => ListView(
        padding: const EdgeInsets.only(right: 15, left: 15),
        scrollDirection: Axis.horizontal,
        children: [
          productCard(context),
          productCard(context),
          productCard(context),
        ],
      );

  Padding productCounterText() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Text(
        "2",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Expanded productAbout() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 22.0, left: 22, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: GRAY_TEXT),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productCardHeader(),
                productDesc(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column productCardHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            productHeaderTitle(),
            Spacer(),
            productStars(),
          ],
        ),
        productPrice(),
      ],
    );
  }

  Text productHeaderTitle() {
    return Text(
      "Ice Creamy",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Row productStars() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: DARK_RED,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: DARK_RED,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: GRAY_TEXT,
        ),
      ],
    );
  }

  Text productPrice() {
    return Text("Rp 12.000",
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold));
  }

  Text productDesc() {
    return Text(
      "lorem ipsum dolor sit amet, cosectetur elit, sed do eiusmod tempor",
      style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600),
    );
  }

  Expanded productBuyArea() {
    return Expanded(
      flex: 1,
      child: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 22.0, left: 22, top: 10, bottom: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  counterButton(Icons.exposure_neg_1),
                  productCounterText(),
                  counterButton(Icons.exposure_plus_1),
                ],
              ),
            ),
            // Spacer(flex:5),
            Expanded(child: productSendButton())
          ]),
        ),
      ),
    );
  }

  RaisedButton productSendButton() {
    return RaisedButton(
      onPressed: null,
      textColor: WHITE,
      color: Colors.blue,
      disabledColor: Colors.blue,
      child: Text(
        "Gas, Lanjutkan",
        style: TextStyle(color: WHITE),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  DottedBorder counterButton(IconData icon) {
    return DottedBorder(
      color: GRAY_TEXT,
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Icon(icon, color: GRAY_TEXT),
      ),
    );
  }

  Widget productCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
          width: PhoneScreen(context).width * 0.85,
          height: PhoneScreen(context).height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: RED,
            image: DecorationImage(
                alignment: Alignment.center,
                image: NetworkImage(
                    "https://i.pinimg.com/originals/09/b8/5d/09b85d4229cf6fe420e5f9e7f2bbfd32.jpg"),
                fit: BoxFit.cover),
          )),
    );
  }
}
