import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/shop/products_category/_widgets/products_category_item.dart';
import 'package:hayah_karema/app/pages/shop/products_category/products_category_controller.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/app_tool_bar_actions.dart';


class ProductSCategoryView extends GetView<ProductsCategoryController> {
  ProductSCategoryView({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          children: [
            /// toolbar.
            AppToolbar(
              title: "هواتف جوالات سامسونج وأبل جديدة 2022",
              backCallBack: () => Get.back(),
              actions: AppToolBarActions(
                onBasketTap: (){},
                onFilterTap: (){},
              ),
            ),
            Expanded(
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    /// the body
                   Obx((){
                     if (controller.getApiLoading.value) {
                       return const Center(child: CircularProgressIndicator(),);
                     }
                     if (controller.productsList.isEmpty) {
                       return const Center(child: EmptyResponse(),);
                     }
                     return GridView.builder(
                         physics: const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         padding: const EdgeInsets.only(top: 22,bottom: 20,left: 16,right: 16),
                         itemCount: controller.getApiLoading.value ?1: controller.productsList.length,
                         gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                           childAspectRatio: (((1.sw-30.w)/2) / 340.h),
                           // childAspectRatio: 165.5/275,
                           mainAxisSpacing: 10.0,
                           crossAxisSpacing: 5.0,
                           crossAxisCount: 2,
                         ),
                         itemBuilder: (c,index)=> ProductsCategoryItem(
                           onItemTap: (){
                             controller.goToShopDetailsView(controller.productsList[index].productId);
                           },
                           onBuyTap: (){},
                           title: controller.productsList[index].productName ??"",
                           companyName: controller.productsList[index].vendor ??"",
                           photo: controller.productsList[index].productAvatar ??"",
                           price:controller.productsList[index].price  ,
                           rate:controller.productsList[index].rating  ,

                         ));
                   })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
