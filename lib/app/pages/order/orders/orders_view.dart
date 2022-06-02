import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/order/orders/_widgets/orders_app_bar_actions.dart';
import 'package:hayah_karema/app/pages/order/orders/_widgets/orders_item.dart';
import 'package:hayah_karema/app/pages/order/orders/_widgets/tabs_button_item.dart';
import 'package:hayah_karema/app/pages/order/orders/orders_controller.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';


class OrdersView extends GetView<OrdersController> {
  OrdersView({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                      _buildTab(),
                       SizedBox(height: 16.h,),
                      _buildTabBarView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// toolbar.
  AppToolbar _buildAppToolbar() {
    return AppToolbar(
      title: AppText.myOrders,
      actions: OrdersAppBarActions(
        onSearchTap: () {},
        onFilterTap: () {},
      ),
      drawerCallBack: () => scaffoldKey.currentState?.openDrawer(),
    );
  }

  /// Build Tabs
  Widget _buildTab() {
    return Obx(() {
      return Container(
          padding:AppDimens.verticalPadding,
          decoration:  BoxDecoration(
            color: const Color(0xFFFEF1E8),
            borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(15.r), bottomRight: Radius.circular(15.r)),
          ),
          child: Row(
            children: [
              SizedBox(width: 16.w,),
              Flexible(
                  flex: 1,
                  child:  TabsButtonItem(
                    name: AppText.currentOrders,
                    onTap: ()=>controller.currentTabIndex.value = 0,
                    selected: controller.currentTabIndex.value == 0,
                  )),
              SizedBox(width: 16.w,),
              Flexible(
                  flex: 1,
                  child:  TabsButtonItem(
                    name: AppText.previousOrders,
                    onTap: ()=>controller.currentTabIndex.value = 1,
                    selected: controller.currentTabIndex.value == 1,

                  )),
              SizedBox(width: 16.w,),
            ],
          )
      );
    });
  }

  /// TabBar view
  Widget _buildTabBarView() {
    return Obx(() {
      if (controller.currentTabIndex.value == 0) {
        // return الطلبات الحالية
        return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (c,i)=> OrdersItem(
              onTap: () => controller.goToOrderDetailsView(),
              price:8500 ,
              date: "2022-02-14 05:45 م",
              orderNumber:"123456789" ,
              numberOfElements: 3,
              orderStatus: i==0?AppText.inProgress:i==1?AppText.canceled:i==2?AppText.shipping:i==3?AppText.deliveryInProgress:AppText.delivered,
              orderStatusColor:i==0?AppColors.current.text1.withOpacity(.1):i==1?const Color(0xFFFF4B4B).withOpacity(.1):i==2?AppColors.current.secondary.withOpacity(.1):
              i==3?AppColors.current.accent.withOpacity(.1):AppColors.current.primary.withOpacity(.1),
              orderStatusTextColor:i==0?AppColors.current.text1:i==1?const Color(0xFFFF4B4B):i==2?AppColors.current.secondary:
              i==3?AppColors.current.accent:AppColors.current.primary,
            ),
            separatorBuilder: (_,__)=>Divider(color: AppColors.current.accent,thickness: 1.h,endIndent: 16.w,indent: 16.w,height: 1.h,),
            itemCount: 5);
      }
      // return الطلبات السابقة
      return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (c,i)=> OrdersItem(
            price:8500 ,
            date: "2022-02-14 05:45 م",
            orderNumber:"123456789" ,
            numberOfElements: 4,
            orderStatus: i==0?AppText.inProgress:i==1?AppText.canceled:i==2?AppText.shipping:i==3?AppText.deliveryInProgress:AppText.delivered,
            orderStatusColor:i==0?AppColors.current.text1.withOpacity(.1):i==1?const Color(0xFFFF4B4B).withOpacity(.1):i==2?AppColors.current.secondary.withOpacity(.1):
            i==3?AppColors.current.accent.withOpacity(.1):AppColors.current.primary.withOpacity(.1),
            orderStatusTextColor:i==0?AppColors.current.text1:i==1?const Color(0xFFFF4B4B):i==2?AppColors.current.secondary:
            i==3?AppColors.current.accent:AppColors.current.primary,
          ),
          separatorBuilder: (_,__)=>Divider(color: AppColors.current.accent,thickness: 1.h,endIndent: 16.w,indent: 16.w,height: 1.h,),
          itemCount: 5);
    });
  }
}
