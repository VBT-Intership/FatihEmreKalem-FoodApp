import 'package:flutter/cupertino.dart';

class PhoneScreen {
  final BuildContext _context;

  PhoneScreen(this._context);

  double get height => MediaQuery.of(this._context).size.height;

  double get width => MediaQuery.of(this._context).size.width;
}
