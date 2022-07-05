import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericModel{
  int? id;
  String? title;
  String? subTitle;
  String? points;
  bool? isSelected;
  RxBool? isSelectedObs;
  IconData? icon;
  String? imgPath;
  Color? backgroundColor;
  Color? foregroundColor;
  DateTime? date;
  Function? callBack;
  GenericModel({this.id, this.title, this.subTitle, this.isSelected, this.icon, this.imgPath, this.backgroundColor,
    this.foregroundColor, this.date, this.callBack, this.points, this.isSelectedObs});


}