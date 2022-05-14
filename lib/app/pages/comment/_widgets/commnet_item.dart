import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/3dots_view.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image:  DecorationImage(fit: BoxFit.fill, image: AssetImage(AppAssets.userIcon,))),
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
