import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';

class GridItemView extends StatelessWidget {
  final GenericModel model;

  const GridItemView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.current.accent, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.current.dimmedLight),
                  child: LayoutBuilder(builder: (context, constrains) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          model.imgPath ?? '',
                          width: constrains.maxWidth,
                          height: constrains.maxWidth,
                          errorBuilder: (_, __, ___) => Container(width: constrains.maxWidth,
                            height: constrains.maxWidth, color: Colors.grey[200],),
                        ));
                  }))),
          const SizedBox(
            height: 10,
          ),
          (model.title == null || model.title!.isEmpty)
              ? const Text('')
              : FittedBox(
              child: Text(model.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize))),
          const SizedBox(
            height: 10,
          ),
          (model.subTitle == null || model.subTitle!.isEmpty)
              ? const Text('')
              : FittedBox(
                  child: Text(
                  model.subTitle ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Get.textTheme.bodyText2?.fontSize, color: AppColors.current.accent),
                  textAlign: TextAlign.center,
                )),
          const SizedBox(
            height: 10,
          ),
          BigBtn(
              text: AppText.more,
              onPressed: () {
                if (model.callBack == null) return;
                model.callBack!();
              })
        ],
      ),
    );
  }
}
