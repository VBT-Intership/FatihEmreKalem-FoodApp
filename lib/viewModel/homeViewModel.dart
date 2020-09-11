import 'package:foodApp/view/home/Ihome.dart';
import 'package:flutter/material.dart';
import '../services/httpSweetService.dart';

abstract class HomeScreenModel extends State<HomeScreenView>
    with HttpSweetService {
  @override
  void initState() {
    super.initState();
    getSweetList;
  }
}
