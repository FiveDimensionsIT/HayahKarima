import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/app_tool_bar_actions.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/category_item.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/product_category_title';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/product_item.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/search_item.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/seller_slide_bottom_sheet.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/show_more.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';

import 'product_controller.dart';

class ProductSView extends GetView<ProductsController> {
   ProductSView({Key? key}) : super(key: key);
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

                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        padding: const EdgeInsets.only(bottom: AppDimens.paddingSize16),
                        itemBuilder: (cxt, index) {
                      return Column(
                        children: [
                          /// general item of see all
                          _buildCategoryTitle("هواتف جوالات سامسونج وأبل جديدة 2022"),

                          /// main item of the screen
                          _buildCategoryList(),
                        ],
                      );
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

   SizedBox _buildCategoryList() {
    return SizedBox(
      height: 275.h,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize16),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) => i == 3
              ? InkWell(
                  onTap: () {
                    controller.goToProductsCategoryView();
                  },
                  child: const ShowMore())
              : ProductItem(
                  onItemTap: () => controller.goToShopDetailsView(),
                  companyName: "المصرية للاتصالات",
                  price: "8500",
                  title: "آيفون اكس برو مكس",
                  rate: "4.5",
                  photo: "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80",
                ),
          separatorBuilder: (_, __) => const SizedBox(
                width: 16,
              ),
          itemCount: 4),
    );
  }

  ProductCategoryTitle _buildCategoryTitle(String title) {
    return ProductCategoryTitle(
                    title: title,
                    onSeeAllTap: (){
                      controller.goToProductsCategoryView();
                    },
                  );
  }

  Widget _buildShopServices() {
    return SizedBox(
      height: 65,
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
              onBasketTap: (){},
              onFilterTap: (){},
            ),
            drawerCallBack: () => scaffoldKey.currentState?.openDrawer(),
          );
  }
}
