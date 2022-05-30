import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

class ShowMore extends StatelessWidget {

  const ShowMore(
      {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,width: 150,
      padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
      //  border: Border.all(color:  AppColors.current.accent, width: 2),
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFEF1E8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(Icons.arrow_forward, color: AppColors.current.accent,size: 30,),
          const SizedBox(height: 10,),
          Text(AppText.productShowMore,
            style: TextStyle(
                color: AppColors.current.accent,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),


        ],
      ),
    );
  }
}
