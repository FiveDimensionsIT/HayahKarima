import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/shadow_view.dart';

import '../../common/themes/app_colors.dart';

class NotificationView extends StatelessWidget{

   NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        body:_buildBody(),
    );
  }
   Widget _buildBody() {
     return SafeArea(
       child: Column(
         children: [
           /// toolbar.
           AppToolbar(
             title: AppText.notification, backCallBack: () {
           },
           ),
           SizedBox(height: Get.height/36,),
           _buildButtons(),
           SizedBox(height: Get.height/36,),
           _contentNotification(),
         ],
       ),
     );
   }
   // build tab bar view
  Widget _buildButtons(){
    return Row(
      children: [
        SizedBox(width: Get.width/16,),
        _buildContentButton(AppText.all, Get.width/8, AppColors.current.neutral,AppColors.current.accent),
        SizedBox(width: Get.width/16,),
        _buildContentButton(AppText.notRead, Get.width/3, AppColors.current.neutral,AppColors.current.accent.withOpacity(0.2)),
      ],
    );
  }
  Widget _buildContentButton(String text,double width,Color fontColor,Color colorContinaer){
    return  Container(
      width: width,
      //width: Get.width/3,
      decoration: BoxDecoration(
          color: colorContinaer,
          borderRadius: BorderRadius.circular(12)
      ),
      child: InkWell(
        onTap: (){},
        child:
        Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(color:fontColor),
        ),
      ),
    );
  }
  Widget _contentNotification(){
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
          itemBuilder:(context,index){
          return ShadowView(
            child: Container(
              color: index % 2 == 0 ? AppColors.current.neutral 
                  : AppColors.current.primary.withOpacity(0.05),
              child: Row(
                children: [
                  Container(
                    width: 64,height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/icon_user.png',
                        )
                      )
                    ),

                  ),
                  const SizedBox(width: 16,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(
                      width: Get.width/1.65,
                      child:  Text('هناك حقيقة مثبتة منذ زمن طويل وهى ان المحتوى المقروء لصفحة  ',
                        maxLines: 2,
                        softWrap: true,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.current.text,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Text('14 الاثنين.فبراير 2022',
                    style: TextStyle(
                      color: AppColors.current.primary
                    ),
                    ),
                  ],),
                  SizedBox(
                    width: Get.width/12,
                    child: Text("...",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.current.dimmed,
                          letterSpacing: 1
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
          );
          }),
    );
  }
}