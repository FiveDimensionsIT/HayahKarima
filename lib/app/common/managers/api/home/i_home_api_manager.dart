import 'package:hayah_karema/app/common/managers/api/home/_models/digital_pointer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';

abstract class IHomeApiManager{

  Future<List<PointerItemModel>?> getStatisticNumber(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getProvincesPointer(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getCentersPointer(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getVillagesPointer(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getCitizensPointer(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getCategoriesPointer(DigitalPointerRequest pointerRequest);

}