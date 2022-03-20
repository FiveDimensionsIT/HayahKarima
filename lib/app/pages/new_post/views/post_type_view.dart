import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/pages/new_post/new_post_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class PostTypeView extends StatelessWidget {
  PostTypeView({Key? key}) : super(key: key);

  final controller = Get.find<NewPostController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 90),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]),
      child: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// action sheet indicator
            const ActionSheetIndicator(),

            Empty(
              height: 20,
            ),

            /// toolbar
            _buildToolbar(),

            Empty(
              height: 20,
            ),

            _buildPostsTypeList(),
          ],
        ),
      ),
    );
  }

  Row _buildToolbar() {
    return Row(
      children: [
        /// back button
        IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.current.accent,
              size: 20,
            )),

        Text(
          AppText.choosePostType,
          style: TextStyle(
              fontSize: Get.textTheme.headline3?.fontSize,
              color: AppColors.current.accent,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPostsTypeList() {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (cxt, index) => _buildPostTypeItem(controller.postTypeList[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 8,),
          itemCount: controller.postTypeList.length),
    );
  }

  Widget _buildPostTypeItem(GenericModel item) {
    return MaterialButton(
      onPressed: ()=> controller.onPostTypeChange(item),
      elevation: 0,
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.current.dimmedLight.withOpacity(0.5)),
        child: Row(
          children: [
            SvgPicture.asset(item.imgPath ?? ''),
            const SizedBox(
              width: 20,
            ),
            Text(
              item.title ?? '',
              style: Get.textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
