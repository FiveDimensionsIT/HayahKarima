import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewPostController extends GetxController{

  final ImagePicker imgpicker = ImagePicker();
  RxList<XFile> imagefiles=<XFile>[].obs;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      if (pickedfiles != null && pickedfiles.isNotEmpty) {
        imagefiles.assignAll(pickedfiles);

      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

}