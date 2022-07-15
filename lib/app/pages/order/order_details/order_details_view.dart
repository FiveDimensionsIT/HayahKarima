import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/order/order_details/_widgets/order_contents_item.dart';
import 'package:hayah_karema/app/pages/order/order_details/_widgets/shipping_address_item.dart';
import 'package:hayah_karema/app/pages/order/order_details/_widgets/summary_item.dart';

import 'order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// toolbar.
            _buildAppToolbar(),

            Expanded(
              child:  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// body
                    _buildMainText(AppText.orderContent),
                    _buildOrderContentsItem(),
                    _buildMainText(AppText.shippingAddress),
                    _buildShippingAddressItem(),
                    _buildMainText(AppText.receiverData),
                    _buildDataTextItem("إسم المستلم"),
                    _buildMainText(AppText.paymentMethod),
                    _buildDataTextItem("نقدا عند الاستلام"),
                    _buildMainText(AppText.shippingType),
                    _buildDataTextItem("شحن عن طريق البريد المصري"),
                    _buildSummaryItem(),
                    _buildRegisterOrderButton(),
                    _buildCancelOrderButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildRegisterOrderButton (){
    return Container(
      height: 50.h,width: 1.sw,
      margin: AppDimens.horizontalPadding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F6F5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(AppText.registerOrder,
        style: TextStyle(
            fontSize: AppDimens.fontSizeLargeX,
            color: AppColors.current.primary,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  Widget _buildCancelOrderButton (){
    return Container(
      height: 50.h,width: 1.sw,
      margin: AppDimens.pagePadding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color:const Color(0xFFFF4B4B)),
        //color: const Color(0xFFE8F6F5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(AppText.cancelOrder,
        style: TextStyle(
            fontSize: AppDimens.fontSizeLargeX,
            color:const Color(0xFFFF4B4B),
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  /// build App Toolbar
  AppToolbar _buildAppToolbar() {
    return AppToolbar(
      title: AppText.back,
      backCallBack: () => Get.back(),

    );
  }
  /// build Summary Item
  SummaryItem _buildSummaryItem(){
    return  const SummaryItem(
      price: 1000,
      additionalCosts: 100,
      totalPrice: 10000,
    );
  }
  /// build Main Text
  Widget _buildMainText(String name){
    return Padding(
      padding: AppDimens.pagePadding,
      child: Text(name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:AppDimens.fontSizeLargeX,
        color: AppColors.current.primary,
      ),
      ),
    );
  }
  Widget _buildDataTextItem(String name){
    return Container(
      padding: AppDimens.pagePadding,
      margin: AppDimens.horizontalPadding,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.current.text1.withOpacity(.75)),
      ),
      child: Text(name,
        style: TextStyle(
          fontSize:AppDimens.fontSizeMediumXX,
          color: AppColors.current.text1,
        ),
      ),
    );
  }
  /// build Order Contents Item
  Widget _buildOrderContentsItem(){
    return  ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (c,i)=>const OrderContentsItem(
          price: 20,
          quantity: 2,
          title: "آيفون 12 برو ماكس 128 جيجا",
          photo: "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80",
        ),
        separatorBuilder:(_,__)=>  SizedBox(height: 16.h,), itemCount: 3);
  }
   /// build Shipping Address Item
  ShippingAddressItem _buildShippingAddressItem(){
    return const ShippingAddressItem(
      address: "الدقهلية . المنصورة",
      addressDescription: "أمام الجمعية الشرعية بالمنصورة ، شارع بورسعيد بجوار ، شارع بورسعيد ، المنصورة ، محافظة الدقهلية ، مصر",
    );
  }
}
