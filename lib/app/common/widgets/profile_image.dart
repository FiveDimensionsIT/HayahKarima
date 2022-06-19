import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class ProfileImage extends StatelessWidget {

  final String profileImageUrl;
  final double width;
  final bool isAssetImage;
  const ProfileImage({Key? key, required this.width, required this.profileImageUrl, this.isAssetImage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildUserImg(width);
  }

  Widget _buildUserImg(double width){
    return SizedBox(
      width: width,
      height: width,
      child: DottedBorder(
        color: AppColors.current.accent,
        borderType: BorderType.Circle,
        padding: const EdgeInsets.all(1),
        child: ClipOval(
          child: isAssetImage ? Image.asset(profileImageUrl)
          :FadeInImage.assetNetwork(
              width: width,
              height: width,
              placeholder: AppAssets.userIcon,
              fit: BoxFit.cover,
              image: profileImageUrl,
              imageErrorBuilder: (_, __, ___) =>SizedBox(
                  width: width,
                  height: width,
                  child: Image.asset(AppAssets.userIcon))),
        ),
      ),
    );
  }
}
