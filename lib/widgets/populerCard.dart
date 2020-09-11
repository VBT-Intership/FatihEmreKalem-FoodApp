import 'package:flutter/material.dart';
import '../utils/size.dart';
import '../utils/color.dart';
import 'populerCardTag.dart';
import '../model/sweetModel.dart';

class PopulerCard extends StatelessWidget {
  final SweetModel sweet;

  const PopulerCard({this.sweet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/productDetail', arguments: sweet);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: WHITE,
          ),
          child: Row(
            children: [
              populerCardImage(context),
              populerCardAbout(),
            ],
          ),
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
              image: networkImage,
              fit: BoxFit.cover,
            ),
          )),
    );
  }

  NetworkImage get networkImage {
    return NetworkImage(sweet.image[0]);
  }

  Expanded populerCardAbout() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              populerCardHeader,
              populerCardTags,
              populerCardDetail,
            ],
          ),
        ),
      ),
    );
  }

  Text get populerCardHeader {
    return Text(
      sweet.name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  PopulerCardTag get populerCardTags {
    return PopulerCardTag(tagText1: sweet.tag1, tagText2: sweet.tag2);
  }

  Row get populerCardDetail {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sweet.location,
          style: TextStyle(color: GRAY_TEXT),
        ),
        Text(
          "${sweet.price} tl",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
