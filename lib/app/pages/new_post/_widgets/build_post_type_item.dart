import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/post/_model/post_type.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';


class BuildPostTypeItem extends StatelessWidget {
  final int index;
  final Function onSelectContentType;
  final PostTypeModel item;
  const BuildPostTypeItem({Key? key,
    required this.index,
    required this.onSelectContentType,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        Get.back();
        onSelectContentType(item);
      },
      elevation: 0,
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.current.dimmedLight.withOpacity(0.5)),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/post_type${index+1}.svg'),
            const SizedBox(
              width: 20,
            ),
            Text(
              item.name ?? '',
              style: Get.textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
