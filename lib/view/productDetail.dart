import 'package:flutter/material.dart';
import 'package:foodApp/model/sweetModel.dart';
import '../utils/color.dart';
import '../utils/size.dart';
import 'package:dotted_border/dotted_border.dart';

class ProductDetail extends StatefulWidget {
  final SweetModel sweetProduct;

  const ProductDetail({this.sweetProduct});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_GRAY,
      appBar: AppBar(
        backgroundColor: TRANSPARENT,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.chevron_left, color: LIGHT_BLACK)),
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
        child: ListView.builder(
          padding: const EdgeInsets.only(right: 15, left: 15),
          scrollDirection: Axis.horizontal,
          itemCount: widget.sweetProduct.image.length,
          itemBuilder: (context, i) =>
              productCardImage(context, widget.sweetProduct.image[i]),
        ),
      ),
    );
  }

  Padding productCounterText() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Text(
        widget.sweetProduct.item.toString(),
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
            productStars("2/3"),
          ],
        ),
        productPrice(),
      ],
    );
  }

  Text productHeaderTitle() {
    return Text(
      "${widget.sweetProduct.name}",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget productStars(rating) {
    var starsLength = int.parse(rating[2]);
    var star = int.parse(rating[0]);
    print(star);

    List<Widget> starsList = new List<Widget>();

    for (var i = 0; i < starsLength; i++) {
      if (i < star) {
        starsList.add(Icon(
          Icons.star,
          size: 16,
          color: DARK_RED,
        ));
      } else {
        starsList.add(Icon(
          Icons.star,
          size: 16,
          color: GRAY_TEXT,
        ));
      }
    }

    return Row(
      children: starsList,
    );
  }

  Text productPrice() {
    return Text("${widget.sweetProduct.price} tl",
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold));
  }

  Text productDesc() {
    return Text(
      widget.sweetProduct.desc,
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
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.sweetProduct.item--;
                        });
                      },
                      child: counterButton(Icons.exposure_neg_1)),
                  productCounterText(),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.sweetProduct.item++;
                        });
                      },
                      child: counterButton(Icons.exposure_plus_1))
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
        "Hemen Al",
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

  Widget productCardImage(BuildContext context, String url) {
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
                image: productCardImageLink(url),
                fit: BoxFit.cover),
          )),
    );
  }

  NetworkImage productCardImageLink(url) {
    return NetworkImage(url);
  }
}
