import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/_model/reward_model.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';

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
      child: Obx(() {
        if (controller.getApiLoading.value) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if (controller.rewardsList.isEmpty) {
          return const Center(child: EmptyResponse(),);
        }
        return RefreshIndicator(
          onRefresh: ()=> controller.onRefresh(),
          child: GridView.count(
              padding: AppTheme.pagePadding,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.5,
              children: List.generate(controller.rewardsList.length, (index) {
                return _prizeItem(controller.rewardsList[index]);
              })),
        );
      }),
    );
  }

  Widget _prizeItem(RewardModel model) {
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
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          model.avatar ?? '',
                          width: constrains.maxWidth,
                          height: constrains.maxWidth,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return Center(
                                child: Image.asset(
                              AppAssets.logo,
                              color: AppColors.current.dimmed.withOpacity(0.5),
                            ));
                          },
                        ));
                    // return Stack(
                    //   children: [
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: Container(
                    //       padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    //       decoration: BoxDecoration(
                    //           color: AppColors.current.neutral,
                    //           borderRadius: const BorderRadius.only(
                    //               topLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
                    //       child: Text('متاح 3 عروض', style: TextStyle(
                    //           color: AppColors.current.error, fontSize: Get.textTheme.bodySmall?.fontSize),)),
                    // ),
                    //   ],
                    // );
                  }))),
          const SizedBox(
            height: 10,
          ),
          (model.sponsor == null || model.sponsor!.isEmpty)
              ? Text('',
                  style: TextStyle(fontSize: Get.textTheme.bodyMedium?.fontSize, color: AppColors.current.dimmed))
              : FittedBox(
                  child: Text(model.sponsor ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: Get.textTheme.bodyMedium?.fontSize, color: AppColors.current.dimmed))),
          const SizedBox(
            height: 5,
          ),
          (model.name == null || model.name!.isEmpty)
              ? Text(
                  '',
                  style: TextStyle(fontSize: Get.textTheme.bodyLarge?.fontSize, color: AppColors.current.text),
                )
              : FittedBox(
                  child: Text(
                  model.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Get.textTheme.bodyLarge?.fontSize, color: AppColors.current.accent),
                  textAlign: TextAlign.center,
                )),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
              child: Text(
            ' ${model.requiredPoints}  نقطة ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: Get.textTheme.bodyText1?.fontSize,
                color: AppColors.current.accent,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          const SizedBox(
            height: 10,
          ),
          Obx(() {
            return BigBtn(
                state: model.isReplacingBtnLoading.value ? BtnState.loading : BtnState.active,
                text: AppText.replacing,
                onPressed: () {
                  controller.replacingReward(model);
                });
          })
        ],
      ),
    );
  }
}
