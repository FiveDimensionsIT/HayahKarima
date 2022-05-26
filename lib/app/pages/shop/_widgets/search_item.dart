import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class SearchItem extends StatelessWidget {
 const  SearchItem({Key? key,this.onChanged,this.controller,}) : super(key: key);
  final Function? onChanged;
   final TextEditingController? controller ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
      child: TextFormField(
        controller:controller ,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
          prefixIcon: Padding(padding: const EdgeInsets.all(16), child: Image.asset(AppAssets.searchIcon, width: 20, height: 20,),),
          hintText: "عن ماذا تبحث",
          hintStyle: TextStyle(fontSize: Get.textTheme.headline2?.fontSize,),
        ),
        onChanged: (value) => onChanged!(),
      ),
    );
  }
}
