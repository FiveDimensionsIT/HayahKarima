import 'package:get/get.dart';
import 'package:hayah_karema/services/logger/log.dart';
import 'package:image_picker/image_picker.dart';

class NewPostController extends GetxController{

  var postTitle = ''.obs;
  var postBody = ''.obs;
  var loginLoading = false.obs;
  RxList<XFile> imageFilesList=<XFile>[].obs;

  final ImagePicker _imagePicker = ImagePicker();

  openImages() async {
    try {
      final pickedFiles = await _imagePicker.pickMultiImage();
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        imageFilesList.assignAll(pickedFiles);

      } else {
        Log.error("No image is selected.");
      }
    } catch (e) {
      Log.error("error while picking file: $e");
    }
  }

  void onAddPostButtonClick(){

  }

}