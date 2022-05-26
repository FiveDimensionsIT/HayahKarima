import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/app_tool_bar_actions.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/category_item.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/general_see_all_item.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/search_item.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/shop_item.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';

import 'shop_controller.dart';

class ShopView extends GetView<ShopController> {
   ShopView({Key? key}) : super(key: key);
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
              Padding(
                padding: AppTheme.pagePadding,
                child: Column(
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
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c,i)=> const ShopItem(
                            companyName: "المصرية للاتصالات",
                            price: "8500",
                            title: "آيفون اكس برو مكس",
                            rate: "4.5",
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
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c,i)=> const ShopItem(
                            companyName: "دار بيروت للنشر و التوزيع",
                            price: "850",
                            title: "كتب عربية الهمت الكثيرين جدا من السكان ",
                            rate: "4.5",
                          ),
                          separatorBuilder: (_,__)=>const SizedBox(width: 16,),
                          itemCount: 4),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
