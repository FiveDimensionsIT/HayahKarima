import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/pages/new_post/_widgets/build_post_type_item.dart';
import 'package:hayah_karema/app/pages/new_post/new_post_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class PostTypeView extends StatelessWidget {
  final Function onSelectContentType;
  PostTypeView({Key? key, required this.onSelectContentType}) : super(key: key);

  final controller = Get.put(NewPostController());

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
          AppText.postTitle,
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
          itemBuilder: (cxt, index) => BuildPostTypeItem(
             item:controller.postTypeList[index],
              index: index,
             onSelectContentType: onSelectContentType,
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 8,),
          itemCount: controller.postTypeList.length),
    );
  }

  // Widget _buildPostTypeItem(PostTypeModel item, int index) {
  //   return MaterialButton(
  //     onPressed: (){
  //       Get.back();
  //       onSelectContentType(item);
  //     },
  //     elevation: 0,
  //     padding: const EdgeInsets.all(0),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  //       decoration:
  //           BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.current.dimmedLight.withOpacity(0.5)),
  //       child: Row(
  //         children: [
  //           SvgPicture.asset('assets/images/post_type${index+1}.svg'),
  //           const SizedBox(
  //             width: 20,
  //           ),
  //           Text(
  //             item.name ?? '',
  //             style: Get.textTheme.headline2,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
