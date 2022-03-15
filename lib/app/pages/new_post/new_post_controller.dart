import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/pages/new_post/views/post_type_view.dart';
import 'package:hayah_karema/services/logger/log.dart';
import 'package:image_picker/image_picker.dart';

class NewPostController extends GetxController {

  var postTitle = ''.obs;
  var postBody = ''.obs;
  var loginLoading = false.obs;
  RxList<XFile> imageFilesList = <XFile>[].obs;

  final ImagePicker _imagePicker = ImagePicker();

  final postTypeList = [].obs;

  GenericModel? selectedPostType;


  @override
  void onInit() {
    super.onInit();
    _initPostTypes();
  }

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

  void onAddPostButtonClick() {
// todo remove this just for test
  Get.bottomSheet(PostTypeView(), isDismissible: true, isScrollControlled: true);
  }

  void _initPostTypes() {
    final list = <GenericModel>[
      GenericModel(id: 0, title: 'منشور', imgPath: AppAssets.postType1),
      GenericModel(id: 1, title: 'خبر', imgPath: AppAssets.postType2),
      GenericModel(id: 2, title: 'نعي', imgPath: AppAssets.postType3),
      GenericModel(id: 3, title: 'دعوة فرح', imgPath: AppAssets.postType4),
      GenericModel(id: 4, title: 'نشاط', imgPath: AppAssets.postType5),
      GenericModel(id: 5, title: 'تقديم تهنئة', imgPath: AppAssets.postType6),
      GenericModel(id: 6, title: 'تقديم واجب عزاء', imgPath: AppAssets.postType7),
      GenericModel(id: 7, title: 'إعلان', imgPath: AppAssets.postType8),
      GenericModel(id: 7, title: 'مثل شعبي', imgPath: AppAssets.postType9),
    ];
    postTypeList.assignAll(list);
  }

}