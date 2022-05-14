import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class AllUsersShimmer extends StatelessWidget {
  const AllUsersShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      direction: ShimmerDirection.rtl,
      enabled: true,
      child:
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        padding: const EdgeInsets.only(right: 12,left: 12,top: 12,bottom: 13),
        decoration: BoxDecoration(
          //color:AppColors.current.neutral,
          border: Border.all(color: const Color(0xFF000000)),
          borderRadius: BorderRadius.circular(4),
          // boxShadow: const [
          //   BoxShadow(
          //       color: Color(0x4D000000),
          //       offset: Offset(0, 1.0),
          //       blurRadius: 2.0),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF000000),
                    border: Border.all(color: const Color(0x1F000000)),
                    borderRadius: BorderRadius.circular(40),

                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset("assets/images/icon_user.png",fit: BoxFit.cover,height: 40,width: 40,)
                  ),
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const SizedBox(height: 5),
                      Container(
                        width: 50.0,
                        height: 10.0,
                        color:AppColors.current.neutral,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 80.0,
                        height: 10.0,
                        color:AppColors.current.neutral,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,width: 100,
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEBEBEB).withOpacity(.7),
                      border: Border.all(color: const Color(0xFFEBEBEB).withOpacity(.7)),
                      borderRadius: BorderRadius.circular(4)),
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
                Container(
                  width: 100.0,
                  height: 10.0,
                  color:AppColors.current.neutral,
                ),
                const  SizedBox(width: 20,),
                Container(
                  width: 2.0,
                  height: 15.0,
                  color:AppColors.current.neutral,
                ),
                const    SizedBox(width: 20,),
                const    Icon(Icons.phone_in_talk_outlined,color: Color(0xFF000000),size: 17,),
                const  SizedBox(width: 4,),
                const   Icon(Icons.whatsapp,color: Color(0xFF000000),size: 17,),
                const   SizedBox(width: 10,),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color:AppColors.current.neutral,
                ),
              ],
            ),
            const   SizedBox(height: 20,),
            Row(
              children: [

                Flexible(
                  flex: 1,
                  child: Container(
                    height: 36,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.current.accent,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const  SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEBEBEB),
                        border: Border.all(color: const Color(0xFFEBEBEB)),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const  SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color:AppColors.current.neutral,
                        border: Border.all(color: const Color(0xFFEBEBEB)),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),

              ],
            ),
          ],
        ),
      )
    );
  }
}