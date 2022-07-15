import 'dart:convert';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/post/_model/post_request.dart';
import 'package:hayah_karema/app/common/managers/api/post/_model/post_type.dart';
import 'package:hayah_karema/app/common/managers/api/post/i_post_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/new_post/_widgets/post_type_view.dart';
import 'package:hayah_karema/services/logger/log.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';
import 'package:image_picker/image_picker.dart';

class NewPostController extends GetxController {
  final cacheManager = DI.find<ICacheManager>();
  final _apiManager = DI.find<IPostApiManager>();
  final _action = ActionCenter();

  var contentType = ''.obs;
  var postBody = ''.obs;
  var postApiLoading = false.obs;
  var getApiLoading = false.obs;
  RxList<XFile> imageFilesList = <XFile>[].obs;

  final ImagePicker _imagePicker = ImagePicker();

  final postTypeList = <PostTypeModel>[].obs;

  PostTypeModel? _selectedContentType;

  @override
  void onInit() {
    super.onInit();
    _getPostTypes();
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
    if (_selectedContentType == null) {
      OverlayHelper.showErrorToast("برجاء اختر نوع المحتوى اولاً");
      return;
    }

    if (postBody.value.isEmpty) {
      OverlayHelper.showErrorToast("برجاء ادخل تفاصيل المنشور");
      return;
    }
    _addPostAPI();
  }

  void onChooseContentType() {
    if (getApiLoading.value) return;
    Get.bottomSheet(PostTypeView(onSelectContentType: (PostTypeModel selectedContentType) {
      _selectedContentType = selectedContentType;
      contentType.value = selectedContentType.name ?? '';
      contentType.refresh();
    }), isDismissible: true, isScrollControlled: true);
  }

  void _getPostTypes() async {
    getApiLoading.value = true;
    List<PostTypeModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getPostsType();
    }, checkConnection: true);
    //
    getApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        postTypeList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _addPostAPI() async {
    postApiLoading.value = true;
    final images = <Images>[];
    for (XFile imgFile in imageFilesList) {
      final bytes = await imgFile.readAsBytes();
      final fileName = imgFile.name;
      final extension = imgFile.mimeType;
      images.add(Images(image: MediaModel(filename: fileName, base64: base64Encode(bytes))));
    }

    final userData = cacheManager.getUserData();
    final data = PostRequestModel(
        userId: userData!.id,
        post: postBody.value,
        postTypeId: _selectedContentType!.id,
        date: DateTime.now().toIso8601String(),
        points: 10,
        video: null,
        images: images);

    var result;
    var success = await _action.execute(() async {
      result = await _apiManager.addPost(postRequest: data);
    }, checkConnection: true);
    //
    postApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        OverlayHelper.showSuccessToast(result["message"]);
        Get.back(result: true);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }
}
