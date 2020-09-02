import 'package:flutter/material.dart';
import '../utils/color.dart';

class PopulerCardTag extends StatelessWidget {
  final String tagText1;
  final String tagText2;

  const PopulerCardTag({
    this.tagText1,
    this.tagText2,
  });

  @override
  Widget build(BuildContext context) {
    return (tagText2 == null)
        ? tagArea(tagText1)
        : Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: tagArea(tagText1),
              ),
              tagArea(tagText2)
            ],
          );
  }

  Padding tagArea(_tagText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, top: 5),
      child: Container(
        decoration: BoxDecoration(
            color: tagColorBG(_tagText),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              _tagText,
              style: TextStyle(
                  color: tagColorText(_tagText), fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Color tagColorBG(String value) {
      switch (value.toLowerCase()) {
        case "gorengan":
          return SOFT_YELLOW;
          break;
        case "makanan ringan":
          return SOFT_BLUE;
          break;
        default:
          return SOFT_RED;
          break;
      }
    }

  Color tagColorText(String value) {
    switch (value.toLowerCase()) {
      case "gorengan":
        return DARK_YELLOW;
        break;
      case "makanan ringan":
        return DARK_BLUE;
        break;
      default:
        return DARK_RED;
        break;
    }
    

    
  }
}


