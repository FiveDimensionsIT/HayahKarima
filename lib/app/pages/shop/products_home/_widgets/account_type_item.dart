import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class AccountTypeItem extends StatelessWidget {
  final Color borderColor;
  final Color assetColor;
  final Color buttonColor;
  final String assetName;
  final String buttonText;

  const AccountTypeItem({
    required this.buttonText,
    required this.borderColor,
    required this.assetColor,
    required this.buttonColor,
    required this.assetName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.current.neutral,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SvgPicture.asset(
            assetName,
            color: assetColor,
            fit: BoxFit.cover,
            height: 64,width: 60,
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: buttonColor,
            ),
            child: Text(buttonText,
              style: TextStyle(
                  color: AppColors.current.neutral,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
