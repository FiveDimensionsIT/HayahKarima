import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class ShopItem extends StatelessWidget {
  final String title;
  final String companyName;
  final String price;
  final String rate;
  final String photo;
  const ShopItem(
      {Key? key,
      required this.title,
      required this.price,
        required  this.companyName,
        required this.photo,
      required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,width: 150,
      padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color:  AppColors.current.accent.withOpacity(.75) , width: 2),
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFFFFFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(photo,
                fit: BoxFit.cover, width: 136, height: 124),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(companyName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          style: const TextStyle(
            fontSize: 14,
            color:  Color(0xFF363535)
          ),
          ),
          Text(title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
                fontSize: 18,
                color:  Color(0xFF363535)
            ),
          ),
          Text("$price ج.م ",
            style: const TextStyle(
                fontSize: 18,
                color:  Color(0xFF363535),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8,),
          Container(
            width: 62,
            padding:const EdgeInsets.symmetric(vertical: 6,horizontal: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:  AppColors.current.accent.withOpacity(.1),
            ),
            child: Row(
              children: [
                Text(rate,
                  style:  TextStyle(
                      fontSize: 12,
                      color:  AppColors.current.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 7,),
                 Icon(Icons.star,color:   AppColors.current.accent,size: 20,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
