import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/build_profile_education_view_item.dart';

class ProfileEducationView extends StatelessWidget {
  const ProfileEducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildEducationTab();
  }

  Widget _buildEducationTab() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const BuildProfileEducationViewItem();
        },
        separatorBuilder: (context, index) {
          return _buildDivider();
        });
  }

  // Row _buildEducationItem() {
  //   return Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               ClipOval(
  //                 child: Container(
  //                   width: Get.width / 7,
  //                   height: Get.width / 7,
  //                   color: AppColors.current.primary.withOpacity(0.2),
  //                   child: Image.network(
  //                     '',
  //                     errorBuilder: (_, __, ___) {
  //                       return SvgPicture.asset(AppAssets.graduatedIcon, fit: BoxFit.cover,);
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //
  //           const SizedBox(width: 16,),
  //
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'كلية أداب - قسم مكتبات',
  //                 style: TextStyle(
  //                     color: AppColors.current.text,
  //                     fontSize: Get.textTheme.bodyLarge?.fontSize,
  //                     fontWeight: FontWeight.bold),
  //                 overflow: TextOverflow.ellipsis,
  //                 maxLines: 2,
  //               ),
  //               const SizedBox(height: 5,),
  //               Text(
  //                 'جامعة طنطا',
  //                 style: TextStyle(
  //                     color: AppColors.current.text,
  //                     fontSize: Get.textTheme.bodyLarge?.fontSize,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //               const SizedBox(height: 5,),
  //               Text(
  //                 '1992',
  //                 style: TextStyle(
  //                     color: AppColors.current.primary,
  //                     fontSize: Get.textTheme.bodySmall?.fontSize,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  // }

  Divider _buildDivider() {
    return Divider(
          color: AppColors.current.primary.withOpacity(0.2),
          thickness: 1,
          endIndent: 8,
          indent: 8,
        );
  }
}
