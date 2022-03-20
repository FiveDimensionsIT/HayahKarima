import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/3dots_view.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';


class HomeDetailsView extends StatelessWidget {
   HomeDetailsView({Key? key}) : super(key: key);
  var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return _buildHomeData();
  }

  Widget _buildHomeData() {
    return Column(
        children: [
          Container(
            padding: AppTheme.pagePadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.current.accent, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPersonInfo(),
                Empty(
                  height: 18,
                ),
                _buildPost(),
                Empty(
                  height: 12,
                ),
                _buildTypePost(),
                Empty(
                  height: 12,
                ),
                _buildImagePost(),
                Empty(
                  height: 12,
                ),
                _buildAllStatistic(),
                _buildDivider(),
                _buildBtPost(),
              ],
            ),
          ),
          Empty(height: 16,)
        ],
      );
  }

  Widget _buildPersonInfo(){
    return  Row(
      children: [
        Image.asset(
          'assets/images/person.png',
        ),
        Empty(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مسعد العربى مسعد العربى مسعد العربى مسعد العربى',
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: Get.textTheme.headline3?.fontSize,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '14 الاثنين.فبراير 2022',
                style: TextStyle(
                  color: AppColors.current.primary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Empty(
          width: 8,
        ),
        DotsView(onClick: (){})
      ],
    );
  }

  Widget _buildPost(){
    return  Text(
      'تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب تجارب',
      maxLines: 3,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize:  Get.textTheme.bodyLarge?.fontSize,
      ),
    );
  }

  Widget _buildTypePost(){
    return   Container(
      width: 96,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.current.accent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        'مثل شعبي',
        style: TextStyle(
            fontSize: 14,
            color: AppColors.current.accent,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildImagePost(){
    return CarouselSlider(
      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            'assets/images/home_image.png',
            fit: BoxFit.cover,
            width: 296,
            height: 124,
          ),
        ),
      ],
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
      ),
    );
  }

  Widget _buildAllStatistic(){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatistic('1205','assets/icons/views_green.svg',75),
        _buildStatistic('126','assets/icons/comments_green.svg',64),
        _buildStatistic('3540','assets/icons/stars_green.svg',80),
        _buildStatistic('854','assets/icons/shares_green.svg',70),
      ],
    );
  }

   Widget _buildStatistic(title, icon,double width) {
     return Container(
       width: width,
       height: 36,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12),
         color: AppColors.current.neutral,
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Text(
             title,
             style: TextStyle(color: AppColors.current.primary,fontSize: 12,),
           ),
           SvgPicture.asset(icon,width: 16,height: 16,)
         ],
       ),
     );
   }

   Widget _buildDivider(){
    return Divider(
        color: AppColors.current.background,
        indent: 12,
        endIndent: 12,
        thickness: 2);
   }

   Widget _buildBtPost(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBtLike(icon:'assets/icons/like_orange.svg',
            title:AppText.like,
        onPress: (){
          controller.changeColorBtLike();
        }
        ),
        _buildBtCommentShare(icon: 'assets/icons/comments_orange.svg',
            title:  AppText.comment,
           onPress: (){
          controller.goToCommentView();
           }
        ),
        _buildBtCommentShare(icon:'assets/icons/share_oranges.svg',title: AppText.sharing,
            onPress: (){}),
      ],
    );
   }

  Widget _buildBtCommentShare({required icon,required title,required onPress}) {
    return Container(
      width: 96,
      height: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.current.neutral,
          border: Border.all(width: 2, color: AppColors.current.accent)),
      child: InkWell(
        onTap: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(icon,width: 24,height: 24,),
            Text(
              title,
              style: TextStyle(color: AppColors.current.accent,fontSize:12,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

  }

  Widget _buildBtLike({required icon,required title,required onPress}) {
    return Obx((){
      return Container(
        width: 96,
        height: 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: controller.isSelected.value?AppColors.current.accent:AppColors.current.neutral,
            border: Border.all(width: 2, color: AppColors.current.accent)),
        child: InkWell(
          onTap:onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(icon,width: 24,height: 24,
                color: controller.isSelected.value?AppColors.current.neutral:AppColors.current.accent,),
              Text(
                title,
                style: TextStyle(color: controller.isSelected.value?AppColors.current.neutral:AppColors.current.accent
                    ,fontSize:12,fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
    });

  }


}
