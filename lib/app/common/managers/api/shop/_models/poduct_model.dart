import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/enums/user_status.dart';
import 'package:hayah_karema/utils/NumberHelper.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class ProductItemModel extends Serializable {
  int? productId;
  String? productName;
  String? productAvatar;
  int? quantityId;
  String? customizationType;
  int? qtyCustomizationTypeId;
  dynamic price;
  dynamic discount;
  dynamic priceAfterDiscount;
  String? vendor;
  dynamic rating;

  ProductItemModel({
    this.productId,
    this.productName,
    this.productAvatar,
    this.quantityId,
    this.customizationType,
    this.qtyCustomizationTypeId,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.vendor,
    this.rating
  });

  @override
  void fromMap(Map<String, dynamic> map) {
    productId = map['productId'];
    productName = map['productName'];
    productAvatar = map['productAvatar'];
    quantityId = map['quantityId'];
    customizationType = map['customizationType'];
    qtyCustomizationTypeId = map['qtyCustomizationTypeId'];
    price = map['price'];
    discount = map['discount'];
    priceAfterDiscount = map['priceAfterDiscount'];
    vendor = map['vendor'];
    rating = map['rating'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    data['productAvatar'] = productAvatar;
    data['quantityId'] = quantityId;
    data['customizationType'] = customizationType;
    data['qtyCustomizationTypeId'] = qtyCustomizationTypeId;
    data['price'] = price;
    data['discount'] = discount;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['vendor'] = vendor;
    data['rating'] = rating;
    return data;
  }

}
