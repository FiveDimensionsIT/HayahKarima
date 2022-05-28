import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/app_tool_bar_actions.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/button_item.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/rating_item.dart';
import 'package:hayah_karema/app/pages/shop/_widgets/shop_detail_item.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';

import '../shop_controller.dart';

class ShopDetailsView extends GetView<ShopController> {
  ShopDetailsView({Key? key}) : super(key: key);
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
                title: AppText.back,
                backCallBack: () => Get.back(),
                actions: AppToolBarActions(
                  onBasketTap: (){},
                  onFilterTap: (){},
                ),
              ),
              /// the body
              Column(
                children: [
                 const ShopDetailItem(
                    title: "Apple آبل آيفون 12 برو ماكس 256 جيغا بايت لون فضة ضمان سنة",
                    companyName: "المصرية للاتصالات",
                    price: "8500",
                    photo:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80",
                    description: "آبل آيفون 12 برو ماكس 256 جيغا بايت iPhone 12 Pro Max هو الطراز المتطور ذو التنسيق الكبير للجيل الرابع عشر من هواتف Apple الذكية التي تم الإعلان عنها في 13 أكتوبر 2020. وهو مزود بشاشة OLED HDR مقاس 6.7 بوصة تبلغ 60 هرتز ، وهو أكبر جهاز iPhone تقدمه على الإطلاق المصنع. متوافق مع 5G ، مستشعر الصور الثلاثية بزاوية عريضة للغاية ومقربة (x5 بصري) وشبكة 5G متوافقة مع Apple A14 Bionic SoC (أقل من 6 جيجاهرتز)",
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                      padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (c,i)=>const RatingItem(
                        name: "مجدي عادل",
                        rate: 5,
                        date:"2022-02-14 05:45 م" ,
                        comment: "تأتي تقييمات العملاء في أشكال مختلفة. يمكن أن يؤدي تضمين عدد قليل من العناصر الجيدة على الخدمات الخاصة بك إلى تحسين فرصك في كسب المزيد من العملاء - من الذي لا يريد ذلك؟",
                      ),
                      separatorBuilder: (_,__)=>const Divider(height:32 ,thickness: 1,color:  Color(0xFFF47321),),
                      itemCount: 2),
                   ButtonItem(
                    title:"شراء" ,
                    onButtonTap: (){},
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