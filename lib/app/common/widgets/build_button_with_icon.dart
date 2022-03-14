import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildButtonWithIcon extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final VoidCallback onPress;

  const BuildButtonWithIcon(
      {Key? key,
        required this.title,
        required this.icon,
        required this.color,
        required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onPress,
        child: Row(children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 10,),
          Text(title, style: TextStyle(color: color),),
        ],),
      ),
    );
  }
}