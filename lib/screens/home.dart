import 'package:flutter/material.dart';
import '../utils/color.dart';
import '../utils/size.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../widgets/horizontalCard.dart';
import '../widgets/populerCard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_GRAY,
      appBar: AppBar(
        backgroundColor: TRANSPARENT,
        elevation: 0,
        leading: Icon(Icons.chevron_left, color: LIGHT_BLACK),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            color: LIGHT_BLACK,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            headerArea(context),
            horizontalCardList(context),
            Expanded(
              child: Container(
                color: Colors.grey[100],
                width: double.infinity,
                child: Column(
                  children: [
                    populerCardHeaderArea(),
                    Expanded(
                      child: Container(
                        child: ListView(
                          children: [
                            PopulerCard(),
                            PopulerCard(),
                            PopulerCard(),
                            PopulerCard(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget populerCardHeaderArea() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: ListTile(
        leading: loveIcon(),
        title: Text("Popular",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        subtitle: Text("Monggo, entekno duwekmu!",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: GRAY_TEXT, fontSize: 12)),
        trailing: Icon(
          Icons.arrow_forward,
          color: LIGHT_BLACK,
        ),
      ),
    );
  }

  Container loveIcon() {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: RED),
      width: 50,
      height: 50,
      child: Icon(Icons.favorite, color: WHITE),
    );
  }

  Widget horizontalCardList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:15.0),
      child: Container(
        width: double.infinity,
        height: PhoneScreen(context).height * 0.22,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            HorizontalCard(),
            HorizontalCard(),
            HorizontalCard(),
            HorizontalCard(),
          ],
        ),
      ),
    );
  }

  Container headerArea(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 35, right: 30,bottom: 25),
        child: Row(
          children: [
            Text(
              "What do you want \n to eat today?",
              style: headerTextStyle,
            ),
            Spacer(),
            searchButton(context)
          ],
        ),
      ),
    );
  }

  Container searchButton(BuildContext context) {
    return Container(
        width: PhoneScreen(context).width * 0.13,
        height: PhoneScreen(context).width * 0.13,
        decoration: searchButton_decoration(),
        child: Icon(AntDesign.search1));
  }

  BoxDecoration searchButton_decoration() {
    return BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.01,
              blurRadius: 30,
              offset: Offset(0, 0.1)),
        ]);
  }

  TextStyle get headerTextStyle => TextStyle(
      color: LIGHT_BLACK,
      fontSize: 30,
      letterSpacing: 1.3,
      fontWeight: FontWeight.bold);
}
