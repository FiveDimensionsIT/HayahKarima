import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
          style: const TextStyle(
            fontSize: 18,
            color:  Color(0xFF363535),
          ),
        ),
       const SizedBox(height: 8,),
        Text(date,
          style: const TextStyle(
            fontSize: 18,
            color:  Color(0xFF363535),
          ),
        ),
        const SizedBox(height: 8,),
        RatingBar(
          ratingWidget: RatingWidget(
            full: const Icon(
              Icons.star,
              color:Color(0xFFF47321),
            ),
            empty: const Icon(
              Icons.star_border,
              color:Color(0xFFF47321),
            ),
            half: const Icon(
              Icons.star_half,
              color:Color(0xFFF47321),
            ),
          ),
          unratedColor:const  Color(0xFFF47321),
          glowColor: const  Color(0xFFFFFFFF),
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
          style: const TextStyle(
            fontSize: 14,
            color:  Color(0xFF363535),
          ),
        ),
      ],
    );
  }
}
