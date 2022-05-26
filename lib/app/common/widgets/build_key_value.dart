import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class BuildKeyValue extends StatelessWidget {
  final String mKey;
  final String? mValue;
  const BuildKeyValue({required this.mKey, this.mValue, Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return mValue==null || mValue!.isEmpty ? const SizedBox(): SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mKey, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.current.text.withOpacity(0.8)),),
              const SizedBox(width: 10,),
              Expanded(child: Text(mValue!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),)),
            ],),
          const Divider(height: 8,),
        ],
      ),
    );
  }
}
