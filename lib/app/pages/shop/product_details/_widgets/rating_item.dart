import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({
    required this.name,required this.rate,required this.date,required this.comment,
  Key? key}) : super(key: key);
  final String name;
  final String date;
  final String comment;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
          style:  TextStyle(
            fontSize: 18,
            color:   AppColors.current.text1,//Color(0xFF363535),
          ),
        ),
       const SizedBox(height: 8,),
        Text(date,
          style:  TextStyle(
            fontSize: 18,
            color:   AppColors.current.text1,//Color(0xFF363535),
          ),
        ),
        const SizedBox(height: 8,),
        RatingBar(
          ratingWidget: RatingWidget(
            full:  Icon(
              Icons.star,
              color:AppColors.current.accent,
            ),
            empty:  Icon(
              Icons.star_border,
              color:AppColors.current.accent,
            ),
            half:  Icon(
              Icons.star_half,
              color:AppColors.current.accent,
            ),
          ),
          unratedColor:AppColors.current.accent,
          glowColor: AppColors.current.neutral,
          onRatingUpdate: (val) {
          },
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 15.0,
          tapOnlyMode: false,
          initialRating: rate,ignoreGestures: true,
          updateOnDrag: false,
          direction: Axis.horizontal,
        ),
        const SizedBox(height: 8,),
        Text(comment,
          style:  TextStyle(
            fontSize: 14,
            color:   AppColors.current.text1,//Color(0xFF363535),
          ),
        ),
      ],
    );
  }
}
