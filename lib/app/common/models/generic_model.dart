import 'package:flutter/material.dart';

class GenericModel{
  int? id;
  String? title;
  String? subTitle;
  bool? isSelected;
  IconData? icon;
  String? imgPath;
  Color? backgroundColor;
  Color? foregroundColor;
  DateTime? date;
  Function? callBack;
  GenericModel({this.id, this.title, this.subTitle, this.isSelected, this.icon, this.imgPath, this.backgroundColor,
    this.foregroundColor, this.date, this.callBack});


}