import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';

import '../../common/themes/app_colors.dart';

class CommentView extends StatelessWidget{

   CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        resizeToAvoidBottomInset: false,
        body:_buildBody(),
      bottomNavigationBar: _writeComment(),
    );
  }
   Widget _buildBody() {
     return SafeArea(
       child: Column(
         children: [
           /// toolbar.
           AppToolbar(
             title: '${AppText.comments} (250)', backCallBack: () {
           },
           ),
           SizedBox(height: Get.height/36,),
           _contentNotification(),

         ],
       ),
     );
   }

  Widget _contentNotification(){
    return Expanded(

      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: Get.width/16),
        itemCount: 5,
          itemBuilder:(context,index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      width: Get.width/2,
                      child:  Text('أحمد السيد',
                        maxLines: 1,
                        softWrap: true,
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
                    width: Get.width/8,
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
              SizedBox(
                width: Get.width,
                child:  Text('هناك حقيقة مثبتة منذ زمن طويل وهى ان المحتوى المقروء لصفحة ما سيلهى القارىء عن التركيز على الشكل الخارجى للنص او شكل توضع الفقرات فى الصفحة التى يقرأها  ',
                  style: TextStyle(
                      color: AppColors.current.text,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ],
          );
          }),
    );
  }
  Widget _writeComment(){
    return Container(
      // width: Get.width,
       height: 124,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(4,0),
                blurRadius: 6,
                color:AppColors.current.dimmed)
          ],
          color: AppColors.current.neutral,
        borderRadius:const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        )
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24),
          child: TextFormField(
            controller: null,
            decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(16.0),
                   borderSide: BorderSide(color: AppColors.current.dimmedLight, width: 1.0,),
                 ),
              hintText: AppText.write_comment,
             suffixIcon:  Icon(Icons.send,
             color: AppColors.current.accent,),
            ),
          ),
        ),
      ),
    );
  }
}