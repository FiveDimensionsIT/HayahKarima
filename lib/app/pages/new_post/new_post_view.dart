import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/new_post/new_post_controller.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';
import 'package:image_picker/image_picker.dart';

class NewPostView extends StatelessWidget {
   NewPostView({Key? key}) : super(key: key);

   var controller = Get.find<NewPostController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: Column(
      children: [
        AppToolbar(
          title: AppText.new_post,
          backCallBack: () {},
        ),
        Empty(
          height: 20,
        ),
        _buildTextField(),
        _selectedImage(),
        _buildBottomBar(),
      ],
    ));
  }

  Widget _buildTextField() {
    return SizedBox(
      width: Get.width,
      height: Get.height / 3.5,
      child: TextFormField(
        controller: null,
        maxLines: 5,
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _selectedImage() {
    return SizedBox(
            height: Get.height / 3,
            // todo slider
            child: Obx(
                (){
                  return ListView(

                    scrollDirection: Axis.horizontal,
                    children:controller.imagefiles.map((image) {
                      return Card(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.file(File(image.path), fit: BoxFit.cover),
                        ),
                      );
                    }).toList(),
                  );
                }
            ),
          );
    // : SizedBox(
    // height: Get.height / 3,
    // child: Image.asset(
    // 'assets/images/splash_3.png',
    // fit: BoxFit.cover,
    // ),
    // );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, top: 5),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: AppColors.current.dimmed.withOpacity(0.15),
                blurRadius: 3,
                offset: const Offset(6, 0))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildButton(
                  title: AppText.image,
                  icon: Icon(Icons.image),
                  color: AppColors.current.primaryLight,
                  colorText: AppColors.current.background,
                  onPress: ()=>controller.openImages()),
              BuildButton(
                  title: AppText.activate,
                  icon: Icon(Icons.mood),
                  color: AppColors.current.accentLight,
                  colorText: AppColors.current.background,
                  onPress: () {}),
              BuildButton(
                  title: AppText.live,
                  icon: Icon(Icons.tv),
                  color: AppColors.current.error,
                  colorText: AppColors.current.background,
                  onPress: () {}),
            ],
          ),
          _shareButton(),
        ],
      ),
    );
  }

  Widget _shareButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.current.accent, // background// foreground
            ),
            onPressed: () {},
            child: Text(AppText.share)),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color color;
  final Color colorText;
  final VoidCallback onPress;
  const BuildButton(
      {Key? key,
      required this.title,
      required this.icon,
      required this.color,
      required this.onPress,
      required this.colorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 12),
        child: Container(
          width: 96,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: color, // background// foreground
            ),
            onPressed: onPress,
            icon: icon,
            label: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: colorText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
