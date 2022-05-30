import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/pages/shop/product_details/_widgets/product_detail_item.dart';
import 'package:hayah_karema/app/pages/shop/product_details/_widgets/rating_item.dart';
import 'package:hayah_karema/app/pages/shop/product_details/product_item_details_controller.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/app_tool_bar_actions.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';


class ProductItemDetailsView extends GetView<ProductItemDetailsController> {
  ProductItemDetailsView({Key? key}) : super(key: key);
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

                    _buildProductItemDetails(),

                    _buildProductReviewsList(),

                    _buildBuyBtn(),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppToolbar _buildAppToolbar() {
    return AppToolbar(
            title: AppText.back,
            backCallBack: () => Get.back(),
            actions: AppToolBarActions(
              onBasketTap: (){},
              onFilterTap: (){},
            ),
          );
  }

  ProductDetailItem _buildProductItemDetails() {
    return const ProductDetailItem(
                     title: "Apple آبل آيفون 12 برو ماكس 256 جيغا بايت لون فضة ضمان سنة",
                     companyName: "المصرية للاتصالات",
                     price: "8500",
                     photo:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80",
                     description: "آبل آيفون 12 برو ماكس 256 جيغا بايت iPhone 12 Pro Max هو الطراز المتطور ذو التنسيق الكبير للجيل الرابع عشر من هواتف Apple الذكية التي تم الإعلان عنها في 13 أكتوبر 2020. وهو مزود بشاشة OLED HDR مقاس 6.7 بوصة تبلغ 60 هرتز ، وهو أكبر جهاز iPhone تقدمه على الإطلاق المصنع. متوافق مع 5G ، مستشعر الصور الثلاثية بزاوية عريضة للغاية ومقربة (x5 بصري) وشبكة 5G متوافقة مع Apple A14 Bionic SoC (أقل من 6 جيجاهرتز)",
                   );
  }

  ListView _buildProductReviewsList() {
    return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (c, i) => const RatingItem(
                            name: "مجدي عادل",
                            rate: 5,
                            date: "2022-02-14 05:45 م",
                            comment:
                                "تأتي تقييمات العملاء في أشكال مختلفة. يمكن أن يؤدي تضمين عدد قليل من العناصر الجيدة على الخدمات الخاصة بك إلى تحسين فرصك في كسب المزيد من العملاء - من الذي لا يريد ذلك؟",
                          ),
                      separatorBuilder: (_, __) => Divider(
                            height: 32,
                            thickness: 1,
                            color: AppColors.current.accent,
                          ),
                      itemCount: 2);
  }

  Widget _buildBuyBtn(){
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.paddingSize16, left: AppDimens.paddingSize16, right: AppDimens.paddingSize16),
      child: BigBtn(
        state: BtnState.active,
        text: AppText.buy,
        onPressed: () {},
      ),
    );
  }
}
