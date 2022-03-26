import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';

class DotsView extends StatelessWidget {
  final Function onClick;
  const DotsView({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onClick(),
      child: SizedBox(
        width: 25,height: 25,
        child: SvgPicture.asset(AppAssets.threeDotsIcon,),
      ),
    );
  }
}
