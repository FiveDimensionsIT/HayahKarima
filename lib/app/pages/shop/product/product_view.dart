import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/shop/product/_widgets/app_tool_bar_actions.dart';
import 'package:hayah_karema/app/pages/shop/product/_widgets/category_item.dart';
import 'package:hayah_karema/app/pages/shop/product/_widgets/general_see_all_item.dart';
import 'package:hayah_karema/app/pages/shop/product/_widgets/search_item.dart';
import 'package:hayah_karema/app/pages/shop/product/_widgets/product_item.dart';
import 'package:hayah_karema/app/pages/shop/product/_widgets/show_more.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';

import 'product_controller.dart';

class ProductView extends GetView<ProductController> {
   ProductView({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenuView(),
      backgroundColor: AppColors.current.neutral,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              /// toolbar.
              AppToolbar(
                title: AppText.shop,
                actions: AppToolBarActions(
                 onBasketTap: (){},
                  onFilterTap: (){},
                ),
                drawerCallBack: () => scaffoldKey.currentState?.openDrawer(),
              ),
              /// the body
              Column(
                children: [
                  /// search item
                  SearchItem(
                    controller: controller.searchTextEditingController,
                    onChanged: (val) => "",
                  ),
                  /// main category or what ever
                const SizedBox(height: 24,),
                  SizedBox(
                    height: 65,width: Get.width,
                    child: ListView.separated(
                        padding:const EdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c,i)=>CategoryItem(
                          index: i,
                          title: i==0?"ابدأ البيع":i==1?"عروض اليوم":i==2?"استبدل نقاطك":"الكوبونات",
                          onSeeAllTap: (){},
                        ),
                        separatorBuilder: (_,__)=>const SizedBox(width: 16,),
                        itemCount: 4),
                  ),

                  /// general item of see all
                  GeneralSeeAllItem(
                    title: "هواتف جوالات سامسونج وأبل جديدة 2022",
                    onSeeAllTap: (){},
                  ),
                  /// main item of the screen
                  SizedBox(
                    height: 285,
                    child: ListView.separated(
                        padding:const EdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c,i)=>
                        i==3?
                        const ShowMore()
                            :
                         ProductItem(
                          onItemTap: (){
                            controller.goToShopDetailsView();
                          },
                          companyName: "المصرية للاتصالات",
                          price: "8500",
                          title: "آيفون اكس برو مكس",
                          rate: "4.5",
                          photo:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80",
                        ),
                        separatorBuilder: (_,__)=>const SizedBox(width: 16,),
                        itemCount: 4),
                  ),
                  ///
                  GeneralSeeAllItem(
                    title: "صدر حديثا - كتب ومجالات عربية",
                    onSeeAllTap: (){},
                  ),
                  SizedBox(
                    height: 285,
                    child: ListView.separated(
                        padding:const EdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c,i)=>
                        i==3?
                       const ShowMore()
                            :
                         ProductItem(
                          onItemTap: (){
                            controller.goToShopDetailsView();
                          },
                          companyName: "دار بيروت للنشر و التوزيع",
                          price: "850",
                          title: "كتب عربية الهمت الكثيرين جدا من السكان ",
                          rate: "4.5",
                            photo:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80",
                        ),
                        separatorBuilder: (_,__)=>const SizedBox(width: 16,),
                        itemCount: 4),
                  ),
                 const SizedBox(height: 20,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
