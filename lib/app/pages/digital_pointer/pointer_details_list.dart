import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/admin_filtration_page.dart';

class PointerDetailsListView extends StatelessWidget {
  final String title;
  final Color color;
  final List list;
  const PointerDetailsListView({Key? key, required this.title, required this.list, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: _buildBodyView(),);
  }

  Widget _buildBodyView() {
    return SafeArea(
        child: AdminFiltrationPage(
          title: title,
          backCallBack: () => Get.back(),
          itemBackGround: color,
          list: list,
        ));
  }
}
