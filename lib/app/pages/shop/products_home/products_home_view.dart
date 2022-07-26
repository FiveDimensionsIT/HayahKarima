import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/app_tool_bar_actions.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/category_item.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/products_category_list_item.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/search_item.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/seller_slide_bottom_sheet.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';

import 'products_home_controller.dart';

class ProductsHomeView extends StatelessWidget {
   ProductsHomeView({Key? key}) : super(key: key);
   var controller = Get.find<ProductsHomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenuView(),
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          children: [
            /// toolbar.
            _buildAppToolbar(),

            Expanded(
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    /// the body
                    _buildSearchItem(),

                    /// main category or what ever
                    const SizedBox(height: 24,),

                    _buildShopServices(),

                    _buildProductsCategoryList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   Obx _buildProductsCategoryList() {
    return Obx((){
      if (controller.getApiLoading.value) {
        return const Center(child: CircularProgressIndicator(),);
      }
      if (controller.productsList.isEmpty) {
        return const Center(child: EmptyResponse(),);
      }
      return  ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:1,
          padding: const EdgeInsets.only(bottom: AppDimens.paddingSize16),
          itemBuilder: (cxt, index) => ProductsCategoryListItem(
            title: controller.productsList[index].productName ??"",
              companyName: controller.productsList[index].vendor ??"",
              photo: controller.productsList[index].productAvatar ??"",
              price:controller.productsList[index].price  ,
              rate:controller.productsList[index].rating  ,
              productListLength: controller.getApiLoading.value ?1: controller.productsList.length,
              onProductItemClick: () => controller.goToShopDetailsView(controller.productsList[index].productId ),
              onProductTitleClick: () => controller.goToProductsCategoryView()));
    });
  }

  Widget _buildShopServices() {
    return SizedBox(
      height: 64.h,
      width: Get.width,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) => CategoryItem(
                index: i,
                title: i == 0
                    ? "ابدأ البيع"
                    : i == 1
                        ? "عروض اليوم"
                        : i == 2
                            ? "استبدل نقاطك"
                            : "الكوبونات",
                onTap: () {
                  if (i == 0) {
                    showModalBottomSheet(
                      backgroundColor: AppColors.current.transparent,
                      isScrollControlled: true,
                      context: Get.context!,
                      builder: (ctx) => const SellerSlideBottomSheet(),
                    );
                  }
                },
              ),
          separatorBuilder: (_, __) => const SizedBox(
                width: 16,
              ),
          itemCount: 4),
    );
  }

  SearchItem _buildSearchItem() {
    return SearchItem(
      controller: controller.searchTextEditingController,
      onChanged: (val) => "",
    );
  }

   AppToolbar _buildAppToolbar() {
    return AppToolbar(
      title: AppText.shop,
      actions: AppToolBarActions(
        onBasketTap: () {Get.toNamed(Routes.ORDERS);},
        onFilterTap: () {},
      ),
      drawerCallBack: () => scaffoldKey.currentState?.openDrawer(),
    );
  }
}
