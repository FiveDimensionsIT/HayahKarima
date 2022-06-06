import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class TabsButtonItem extends StatelessWidget {
  const TabsButtonItem({
    Key? key,
    required this.name,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  final String name;
  final bool selected;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        height: 34.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: selected
              ? AppColors.current.accent
              : AppColors.current.accent.withOpacity(0.2),
        ),
        child: Text(
          name,
          style: TextStyle(
            color:
                selected ? AppColors.current.neutral : AppColors.current.accent,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
