import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/shop/product_details/_widgets/product_detail_item.dart';
import 'package:hayah_karema/app/pages/shop/product_details/_widgets/rating_item.dart';
import 'package:hayah_karema/app/pages/shop/product_details/product_item_details_controller.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/app_tool_bar_actions.dart';


class ProductItemDetailsView extends StatelessWidget  {
  ProductItemDetailsView({Key? key}) : super(key: key);
 // final scaffoldKey = GlobalKey<ScaffoldState>();
  var controller = Get.find<ProductItemDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  key: scaffoldKey,
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

  Obx _buildProductItemDetails() {
    return Obx((){
      if (controller.getApiLoading.value) {
        return const Center(child: CircularProgressIndicator(),);
      }
      return  ProductDetailItem(
        images: controller.productDetail.value.images ,
        title: controller.productDetail.value.name ??"",
        companyName: "المصرية للاتصالات",
        price: "8500",
        description:controller.productDetail.value.description ??"",// "آبل آيفون 12 برو ماكس 256 جيغا بايت iPhone 12 Pro Max هو الطراز المتطور ذو التنسيق الكبير للجيل الرابع عشر من هواتف Apple الذكية التي تم الإعلان عنها في 13 أكتوبر 2020. وهو مزود بشاشة OLED HDR مقاس 6.7 بوصة تبلغ 60 هرتز ، وهو أكبر جهاز iPhone تقدمه على الإطلاق المصنع. متوافق مع 5G ، مستشعر الصور الثلاثية بزاوية عريضة للغاية ومقربة (x5 بصري) وشبكة 5G متوافقة مع Apple A14 Bionic SoC (أقل من 6 جيجاهرتز)",
      );
    });
  }

  Obx _buildProductReviewsList() {
   return Obx((){
     if (controller.getApiLoading.value) {
       return const Center(child: CircularProgressIndicator(),);
     }
     if (controller.productDetail.value.reviews?.isEmpty ?? true) {
       return const Center(child: EmptyResponse(),);
     }
     return ListView.separated(
         shrinkWrap: true,
         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
         physics: const BouncingScrollPhysics(),
         itemBuilder: (c, i) =>  RatingItem(
           name: controller.productDetail.value.reviews?[i]?.commenter ??"",
           rate: controller.productDetail.value.reviews?[i]?.rate?.toDouble() ?? 0.0,
           date: controller.productDetail.value.reviews?[i]?.date ?? "",
           comment:controller.productDetail.value.reviews?[i]?.comment ??"",
          // "تأتي تقييمات العملاء في أشكال مختلفة. يمكن أن يؤدي تضمين عدد قليل من العناصر الجيدة على الخدمات الخاصة بك إلى تحسين فرصك في كسب المزيد من العملاء - من الذي لا يريد ذلك؟",
         ),
         separatorBuilder: (_, __) => Divider(
           height: 32,
           thickness: 1,
           color: AppColors.current.accent,
         ),
         itemCount: controller.productDetail.value.reviews!.length );
   });
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
