import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/3dots_view.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/comment/comment_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import '../../common/themes/app_colors.dart';

class CommentView extends GetView<CommentController> {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _writeComment(),
      backgroundColor: AppColors.current.neutral,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          /// toolbar.
          AppToolbar(title: '${AppText.comments} (250)',
            backCallBack: () {
            Get.back();
          },),

          _contentNotification(),
        ],
      ),
    );
  }

  Widget _contentNotification() {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (_, __)=> const Divider(),
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildCommentItem();
          }),
    );
  }

  Widget _writeComment() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      decoration: AppTheme.bottomNavBarDecoration(),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: AppText.writeComment,

            suffixIcon: Icon(
              Icons.send,
              color: AppColors.current.accent,
            ),
          ),
          onChanged: (val){controller.comment.value = val;},
        ),
      ),
    );
  }

  Widget _buildCommentItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(fit: BoxFit.fill, image: AssetImage(AppAssets.userIcon,))),
            ),

            const SizedBox(width: 16,),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'أحمد السيد أحمد السيد أحمد السيد أحمد السيد أحمد السيد أحمد السيد أحمد السيد أحمد السيد',
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.current.text, fontWeight: FontWeight.bold,fontSize: Get.textTheme.headline3?.fontSize),
                  ),
                  Text(
                    '14 الاثنين.فبراير 2022',
                    style: TextStyle(color: AppColors.current.primary, fontSize: Get.textTheme.bodyMedium?.fontSize),
                  ),
                ],
              ),
            ),
            Empty(
              width: 8,
            ),
            DotsView(onClick: (){}),
          ],
        ),

        const SizedBox(height: 10,),

        SizedBox(
          width: Get.width,
          child: Text(
            'هناك حقيقة مثبتة منذ زمن طويل وهى ان المحتوى المقروء لصفحة ما سيلهى القارىء عن التركيز على الشكل الخارجى للنص او شكل توضع الفقرات فى الصفحة التى يقرأها  ',
            style: TextStyle(color: AppColors.current.text, fontWeight: FontWeight.normal),
            textAlign: TextAlign.justify,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
