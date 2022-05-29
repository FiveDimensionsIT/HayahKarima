import 'package:get/get.dart';

class PaymentCardModel{

  String cardId;
  String cardName;
  String cardNumber;
  String cardImgPath;
  String expDate;
  RxBool isSelected = false.obs;

  PaymentCardModel({required this.cardId, required this.cardName, required this.cardNumber, required this.cardImgPath, required this.expDate});

  String get cardTitle {
    late String lastCardNumber;
    if(cardNumber.contains('-')){
      lastCardNumber = cardNumber.split('-').last;
    }else if (cardNumber.isNotEmpty && cardNumber.length>4){
      lastCardNumber = cardNumber.substring(cardNumber.length-4, cardNumber.length);
    } else{
      lastCardNumber = cardNumber;
    }
    return '$lastCardNumber - $expDate';
  }


  bool isSvgAsset(){
    return cardImgPath.substring(cardImgPath.length-3, cardImgPath.length) == 'svg';
  }


}