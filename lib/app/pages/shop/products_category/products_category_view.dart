import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/app_tool_bar_actions.dart';
import 'package:hayah_karema/app/pages/shop/products_category/_widgets/products_category_item.dart';
import 'package:hayah_karema/app/pages/shop/products_category/products_category_controller.dart';


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
                   GridView.builder(
                       physics: const NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       padding: const EdgeInsets.only(top: 22,bottom: 20,left: 16,right: 16),
                       itemCount: 5,
                       gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                         childAspectRatio: (((MediaQuery.of(context).size.width-40)/2) / 340),
                         // childAspectRatio: 165.5/275,
                         mainAxisSpacing: 10.0,
                         crossAxisSpacing: 5.0,
                         crossAxisCount: 2,
                       ),
                       itemBuilder: (c,i)=> ProductsCategoryItem(
                         onItemTap: (){
                           controller.goToShopDetailsView();
                         },
                         companyName: "دار بيروت للنشر و التوزيع",
                         price: "850",
                         title: "كتب عربية الهمت الكثيرين جدا من السكان ",
                         rate: "4.5",
                         photo:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80",
                       ))
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
