import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';

class CategoryItem extends StatelessWidget {
  final Function? onTap;
  final String title;
 final int index;
 const CategoryItem({Key? key, this.onTap,required this.title,required this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: index==0?const Color(0xFFE8F6F5):index==1?const Color(0xFFFEF1E8):
        index==2?const Color(0xFFCB7FE6).withOpacity(.1) :const Color(0xFFF47321).withOpacity(.18) ,
      ),
      child: InkWell(
        onTap: () => onTap!(),
        child: Row(
          children: [
            SvgPicture.asset(
              index==0? AppAssets.sellNow:index==1?AppAssets.flashSales:index==2?AppAssets.exchange:AppAssets.cubones,
              color:index==0? const Color(0xFF22A99B):index==1?const Color(0xFFF47321):index==2?
              const Color(0xFFCB7FE6):const Color(0xFFFF4B4B),
              width: 25,),
            const SizedBox(width: 16,),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  color:index==0? const Color(0xFF22A99B):index==1?const Color(0xFFF47321):index==2?
                  const Color(0xFFCB7FE6):const Color(0xFFFF4B4B),
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
          const  SizedBox(width: 70,),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF000000),size: 22,),

          ],
        ),
      ),
    );
  }
}
