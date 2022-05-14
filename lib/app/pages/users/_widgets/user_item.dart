import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:get/get.dart';

class UserItem extends StatelessWidget {
  final String code;
  final String nickname;
  final int nationalId;

  const UserItem({Key? key,required this.code,required this.nickname,required this.nationalId,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16,),
      padding: const EdgeInsets.only(right: 12,left: 12,top: 12,bottom: 13),
      decoration: BoxDecoration(
        color:AppColors.current.neutral,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
              color: Color(0x4D000000),
              offset: Offset(0, 1.0),
              blurRadius: 2.0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0x1F000000)),
                  borderRadius: BorderRadius.circular(40),

                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("assets/images/icon_user.png",fit: BoxFit.cover,height: 40,width: 40,)
                ),
              ),
             const SizedBox(width: 8,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(nickname,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style:Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 2),
                    Text("$nationalId",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style:Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: const Color(0xFFEBEBEB).withOpacity(.7),
                    border: Border.all(color: const Color(0xFFEBEBEB).withOpacity(.7)),
                    borderRadius: BorderRadius.circular(4)),
                alignment: Alignment.center,
                child: Text(code,//"400-200-001",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style:Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
       const   SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [

              const   Icon(Icons.phone_in_talk_outlined,color: Color(0xFF000000),size: 17,),
              const    SizedBox(width: 10,),
              Text("01001600581",
                style:Theme.of(context).textTheme.headline3,
              ),
              const  SizedBox(width: 20,),
              const  SizedBox(
                  height: 15,
                  child: VerticalDivider(width: 2,color: Color(0xFF000000),)),
              const    SizedBox(width: 20,),
              const    Icon(Icons.phone_in_talk_outlined,color: Color(0xFF000000),size: 17,),
              const  SizedBox(width: 4,),
              const   Icon(Icons.whatsapp,color: Color(0xFF000000),size: 17,),
              const   SizedBox(width: 10,),
              Text("01001600581",
                style:Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          const   SizedBox(height: 20,),
          Row(
            children: [

              Flexible(
                flex: 1,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: AppColors.current.accent,
                      borderRadius: BorderRadius.circular(4)),
                  alignment: Alignment.center,
                  child: Text(
                    "تغيير الحالة",
                    style: TextStyle(
                        fontSize:Get.textTheme.headline4?.fontSize ,
                        color:  AppColors.current.neutral,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const  SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEBEBEB),
                      border: Border.all(color: const Color(0xFFEBEBEB)),
                      borderRadius: BorderRadius.circular(4)),
                  alignment: Alignment.center,
                  child: Text(
                    "تغيير الباسورد",
                    style: TextStyle(
                        fontSize:Get.textTheme.headline4?.fontSize ,
                        color: AppColors.current.accent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const  SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                     // color: AppColors.current.primary,
                      color:AppColors.current.neutral,
                      border: Border.all(color: const Color(0xFFEBEBEB)),
                      borderRadius: BorderRadius.circular(4)),
                  alignment: Alignment.center,
                  child: Text(
                    "التفاصيل",
                    style: TextStyle(
                        fontSize:Get.textTheme.headline4?.fontSize ,
                        color: AppColors.current.text,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
