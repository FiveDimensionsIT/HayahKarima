import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/common/widgets/build_button_with_icon.dart';
import 'package:hayah_karema/app/pages/new_post/new_post_controller.dart';

class NewPostView extends GetView<NewPostController> {
  const NewPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(child: Column(
      children: [
        AppToolbar(title: AppText.new_post, backCallBack: () => Get.back(),),

        const SizedBox(height: 20,),

        _buildPostTitle(),

        const SizedBox(height: 10,),

        _buildPostBody(),

        const SizedBox(height: 10,),

        _selectedImage(),

        const SizedBox(height: 10,),

        _buildBottomBar()
      ],
    ));
  }

  Widget _buildPostTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        decoration:  InputDecoration(hintText: 'post_title'.tr,),
        onSaved: (val){ controller.postTitle.value = val??'';},
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget _buildPostBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        maxLines: 4,
        decoration:  InputDecoration(hintText: 'post_body'.tr,),
        onSaved: (val){ controller.postBody.value = val??'';},
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _selectedImage() {
    return Expanded(
        child: Obx(() {
          if(controller.imageFilesList.isEmpty){return _buildEmptyImage();}

          return CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,

            ),
            items: controller.imageFilesList.map((image) {
              return Card(
                color: AppColors.current.dimmedLight,
                child: SizedBox(
                  // child: Center(child: Text(image.toString())),
                  child: Image.file(File(image.path), fit: BoxFit.cover),
                ),
              );
            }).toList(),
          );
        }));

  }

  Widget _buildEmptyImage(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.current.dimmedLight,
          image: const DecorationImage(image: AssetImage(AppAssets.imgNotFound), fit: BoxFit.cover)),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal:16,),
      decoration: AppTheme.bottomNavBarDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              BuildButtonWithIcon(
                  title: AppText.image,
                  icon: AppAssets.mediaIcon,
                  color: AppColors.current.primary,
                  onPress: () => controller.openImages()),

              const SizedBox(width: 15,),

              BuildButtonWithIcon(
                  title: AppText.activate,
                  icon: AppAssets.activitiesIcon,
                  color: AppColors.current.accent,
                  onPress: () {}),

              const SizedBox(width: 15,),

              BuildButtonWithIcon(
                  title: AppText.live,
                  icon: AppAssets.liveIcon,
                  color: AppColors.current.error,
                  onPress: () {}),
            ],
          ),

          const SizedBox(height: 10,),

          _shareButton(),
        ],
      ),
    );
  }

  Widget _shareButton() {
    return SizedBox(
      width: Get.width,
      child: BigBtn(
        state: controller.loginLoading.value? BtnState.loading: BtnState.active,
        text: AppText.share,
          onPressed: () => controller.onAddPostButtonClick()),
    );
  }
}
