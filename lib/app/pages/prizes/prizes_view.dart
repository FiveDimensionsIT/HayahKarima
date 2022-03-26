import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';

import 'prizes_controller.dart';

class PrizesView extends GetView<PrizesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
        body: SafeArea(
      child: Column(
        children: [
          AppToolbar(
            title: AppText.rewards,
            backCallBack: () => Get.back(),
          ),
          _buildPrizesGrid(),
        ],
      ),
    ));
  }

  Widget _buildPrizesGrid() {
    return Expanded(
        child: GridView.count(
            padding: AppTheme.pagePadding,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.5,
            children: List.generate(10, (index) {
              return _prizeItem(GenericModel());
            })));
  }

  Widget _prizeItem(GenericModel model) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.current.accent, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.current.dimmedLight),
                  child: LayoutBuilder(builder: (context, constrains) {
                    return Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,

                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                model.imgPath ??
                                    'https://islamonline.net/wp-content/uploads/2021/09/Makkah-clock-tower-489x275.jpg',
                                width: constrains.maxWidth,
                                height: constrains.maxWidth,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) {
                                  return Container();
                                },
                              )),
                        ),


                        Align(
                          alignment : Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: AppColors.current.neutral,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
                              child: Text('متاح 3 عروض', style: TextStyle(color: AppColors.current.error, fontSize: Get.textTheme.bodySmall?.fontSize),)),
                        ),
                      ],
                    );
                  }))),
          const SizedBox(
            height: 10,
          ),
          (model.title == null || model.title!.isEmpty)
              ?  Text('وزارة السياحة',style: TextStyle(fontSize: Get.textTheme.bodyMedium?.fontSize, color: AppColors.current.dimmed))
              : FittedBox(
                  child: Text(model.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: Get.textTheme.bodyMedium?.fontSize, color: AppColors.current.dimmed))),
          const SizedBox(
            height: 5,
          ),
          (model.subTitle == null || model.subTitle!.isEmpty)
              ?  Text('رحلة عمرة وفقا للاجر',style: TextStyle(fontSize: Get.textTheme.bodyLarge?.fontSize, color: AppColors.current.text),)
              : FittedBox(
                  child: Text(
                  model.subTitle ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Get.textTheme.bodyLarge?.fontSize, color: AppColors.current.accent),
                  textAlign: TextAlign.center,
                )),
          const SizedBox(
            height: 5,
          ),
          (model.points == null || model.points!.isEmpty)
              ?  Text('5000 نقطة',style: TextStyle(fontSize: Get.textTheme.bodyText1?.fontSize, color: AppColors.current.accent, fontWeight: FontWeight.bold),)
              : FittedBox(
                  child: Text(
                  model.points ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Get.textTheme.bodyText1?.fontSize, color: AppColors.current.accent, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          const SizedBox(
            height: 10,
          ),
          BigBtn(
              text: AppText.replacingPrizes,
              onPressed: () {
                if (model.callBack == null) return;
                model.callBack!();
              })
        ],
      ),
    );
  }
}
