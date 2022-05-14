import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/comment/_widgets/commnet_item.dart';
import 'package:hayah_karema/app/pages/comment/comment_controller.dart';

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
            return CommentItem();
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
  
}
