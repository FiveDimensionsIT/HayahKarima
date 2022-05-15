
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';

class AppLogo extends StatelessWidget{
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.logo,
      fit: BoxFit.contain,
    );
  }

}