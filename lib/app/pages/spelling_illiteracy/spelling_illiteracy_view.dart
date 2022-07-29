import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/pages/spelling_illiteracy/_widgets/spelling_item.dart';

import 'spelling_illiteracy_controller.dart';

class SpellingIlliteracyView extends GetView<SpellingIlliteracyController> {
  const SpellingIlliteracyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.background,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(AppDimens.paddingSize10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.current.primary, width: 2)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  /// ==== toolbar
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.paddingSize5, horizontal: AppDimens.paddingSize10),
                      decoration: BoxDecoration(
                          color: AppColors.current.primary,
                          borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(17), topRight: Radius.circular(17))),
                      child: Center(
                        child: Text('همزة وصل..تعليمك يعني مصر بخير',
                            style: TextStyle(color: AppColors.current.neutral, fontSize: AppDimens.fontSizeMediumXX)),
                      )),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.paddingSize16, vertical: AppDimens.paddingSize10),
                    child: Obx(() {
                      if (controller.levelsList.isEmpty) return const SizedBox();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          /// ==== levels and points
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'المستوي',
                                    style: TextStyle(
                                        color: AppColors.current.primary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: AppDimens.fontSizeMediumXX),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Obx(() {
                                    return DropdownButton<SpellingIlliteracyModel>(
                                      isDense: true,
                                      style: TextStyle(
                                          color: AppColors.current.primary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: AppDimens.fontSizeMediumXX),
                                      underline: const SizedBox(),
                                      items: controller.levelsList
                                          .map((level) =>
                                          DropdownMenuItem(
                                            onTap: () {},
                                            value: level,
                                            child: Text(
                                              '${level.level}',
                                            ),
                                          ))
                                          .toList(),
                                      onChanged: (value) => controller.onLevelChanged(level: value),
                                      value: controller.selectedLevel?.value,
                                    );
                                  }),
                                ],
                              ),
                              Obx(() {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppDimens.paddingSize3, horizontal: AppDimens.paddingSize15),
                                  decoration: BoxDecoration(
                                      color: AppColors.current.accent,
                                      borderRadius: BorderRadius.circular(AppDimens.generalBorderRadius)),
                                  child: Text('كل إجابة صحيحة تكسب ${controller.selectedLevel?.value.points} نقاط',
                                      style: TextStyle(
                                          color: AppColors.current.neutral, fontSize: AppDimens.fontSizeSmallXX)),
                                );
                              })
                            ],
                          ),

                          /// ==== slider
                          Obx(() {
                            if (controller.selectedLevel == null) return const SizedBox();
                            return SizedBox(
                              height: 130,
                              child: PageView(
                                  controller: controller.sliderController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  onPageChanged: (index) => controller.onSliderChangeIndex(pageIndex: index),
                                  children: controller.selectedLevel!.value.contentList
                                      .map((element) => SpellingItem(item: element))
                                      .toList()),
                            );
                          }),

                          /// ==== TextFiled
                          Form(
                            key: controller.formKey,
                            child: Obx(() {
                              return TextFormField(
                                controller: controller.textEditingController,
                                focusNode: controller.focusNode,
                                maxLines: 3,
                                minLines: 1,
                                maxLength: controller.texHint.value.length,
                                textAlign: TextAlign.center,
                                autofocus: true,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: AppDimens.fontSizeLargeXX,
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    overflow: TextOverflow.clip,
                                    wordSpacing: 1),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    fillColor: AppColors.current.dimmedLight,
                                    hintTextDirection: TextDirection.rtl,
                                    filled: true,
                                    hintText: controller.texHint.value,
                                    hintStyle: TextStyle(
                                        color: AppColors.current.primary,
                                        fontSize: AppDimens.fontSizeLargeXX,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.clip,
                                        wordSpacing: 2,
                                        height: 1),
                                    border: outlineInputBorder(),
                                    disabledBorder: outlineInputBorder(),
                                    enabledBorder: outlineInputBorder(),
                                    errorBorder: outlineInputBorder(),
                                    focusedErrorBorder: outlineInputBorder(),
                                    focusedBorder: outlineInputBorder()),
                                onChanged: (value) => controller.onTextEditingChange(value),
                              );
                            }),
                          ),

                          Obx(() {
                            if(controller.errorText.value.isEmpty) return const SizedBox();
                            return Text(controller.errorText.value,
                              style: TextStyle(fontSize: AppDimens.fontSizeMedium, color: AppColors.current.error),);
                          }),

                          const SizedBox(
                            height: 10,
                          ),

                          Obx(() {
                            return Text(
                              '-- ${controller.speedValue.value} --',
                              style: TextStyle(fontSize: AppDimens.fontSizeMediumX),
                            );
                          })
                        ],
                      );
                    }),
                  ),

                  /// ==== Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      /// ==== total points
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimens.paddingSize5, horizontal: AppDimens.paddingSize20),
                        decoration: BoxDecoration(
                            color: AppColors.current.primary,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30), bottomRight: Radius.circular(17))),
                        child: Obx(() {
                          return Text(
                            'رصيد نقاطك ${controller.totalPoints}',
                            style: TextStyle(
                                color: AppColors.current.neutral,
                                fontWeight: FontWeight.w600,
                                fontSize: AppDimens.fontSizeSmallXX),
                          );
                        }),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize15),
                        child: Image.asset(
                          AppAssets.poweredBy,
                          height: 35,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.current.dimmedLight),
        borderRadius: BorderRadius.circular(AppDimens.generalBorderRadius));
  }
}
