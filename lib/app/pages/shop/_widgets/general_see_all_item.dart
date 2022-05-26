import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class GeneralSeeAllItem extends StatelessWidget {
 final  Function? onSeeAllTap;
  final String title;

const  GeneralSeeAllItem({Key? key, this.onSeeAllTap,required this.title, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          Expanded(
              child: Text(title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style:const TextStyle(
            color:  Color(0xFF363535),
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
          )),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child:   Text("المزيد",
              style: TextStyle(
                  color: AppColors.current.accent,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          InkWell(
            onTap: () => onSeeAllTap!(),
            child: Icon(Icons.arrow_forward_ios, color: AppColors.current.accent,size: 16,),
          ),
        ],
      ),
    );
  }
}
