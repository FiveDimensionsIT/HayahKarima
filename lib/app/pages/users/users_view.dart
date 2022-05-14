import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/users/_widgets/user_item.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';

import 'users_controller.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          children: [
            AppToolbar(
                title: AppText.users,
                backCallBack: () => Get.back(),
                actions: IconButton(
                  onPressed: () => Get.toNamed(Routes.ADD_USER),
                  icon: Icon(
                    Icons.add_circle_outline_sharp,
                    color: AppColors.current.primary,
                  ),
                )),

            _buildUsersSearch(),

            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsersSearch() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
        prefixIcon: SizedBox(width: 56, child: Image.asset(AppAssets.searchIcon, width: 20, height: 20,),),
        hintText: AppText.searchCourse,
        hintStyle: TextStyle(fontSize: Get.textTheme.headline2?.fontSize,),
      ),
      onChanged: (value) => controller.filterUsers(value),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: ListView.builder(itemBuilder: (cxt, index)=> const UserItem(), itemCount: 10,),
    );
  }

}
