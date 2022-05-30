
import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/account_type_item.dart';

class SellerSlideBottomSheet extends StatefulWidget {
  const SellerSlideBottomSheet({Key? key}) : super(key: key);
  @override
  _SellerSlideBottomSheetState createState() => _SellerSlideBottomSheetState();
}

class _SellerSlideBottomSheetState extends State<SellerSlideBottomSheet>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          boxShadow:const [
            BoxShadow(
                color: Color(0x14333333),
                offset: Offset(0, -3.0),
                blurRadius: 3.0),
          ],
          borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: ListView(
                children: [
                    const SizedBox(height: 16,),
                   // add line here.
                  Center(
                    child: Container(
                      height: 4,width: 48,
                      color:const Color(0xFFE8F6F5),
                    ),
                  ),
                  const SizedBox(height: 16,),
                   Text(
                     AppText.chooseAccountType,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                     color: AppColors.current.text1,
                   ),
                   ),
                  const SizedBox(height: 16,),
                  Row(
                    children: [
                      const SizedBox(width: 15,),
                      Flexible(
                          flex: 1,
                          child: AccountTypeItem(
                            assetColor:AppColors.current.primary ,
                            assetName: AppAssets.sellNow,
                            borderColor: AppColors.current.primary.withOpacity(.75),
                            buttonColor: AppColors.current.primary,
                            buttonText: AppText.individual,
                          )),
                      const SizedBox(width: 17,),
                      Flexible(
                          flex: 1,
                          child: AccountTypeItem(
                            assetColor:AppColors.current.accent ,
                            assetName: AppAssets.sellNow,
                            borderColor: AppColors.current.accent.withOpacity(.75),
                            buttonColor: AppColors.current.accent,
                            buttonText: AppText.commercial,
                          )),
                      const SizedBox(width: 15,),
                    ],
                  )
                ],
              )),
     //
        ],
      ),
    );
  }
}
