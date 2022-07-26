import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class OrdersRequest extends Serializable{
  int? customerId;
  int? customerAddressId;
  int? paymentMethodId;
  int? shippingMethodId;

  OrdersRequest({this.customerId, this.customerAddressId, this.paymentMethodId, this.shippingMethodId });

  @override
  void fromMap(Map<String, dynamic> map) {
    customerId = map['customerId'];
    customerAddressId = map['customerAddressId'];
    paymentMethodId = map['paymentMethodId'];
    shippingMethodId = map['shippingMethodId'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['customerId'] = customerId;
    data['customerAddressId'] = customerAddressId;
    data['paymentMethodId'] = paymentMethodId;
    data['shippingMethodId'] = shippingMethodId;
    return data;
  }
}

