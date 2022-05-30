import 'package:get/get.dart';

class AddressModel{
  String userName;
  String addressTitle;
  String addressDesc;
  String addressId;
  RxBool isSelected = false.obs;

  AddressModel({required this.userName,required this.addressTitle,required this.addressDesc, required this.addressId});
}