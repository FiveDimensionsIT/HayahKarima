import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/pages/profile/profile_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: SafeArea(
          child: Column(
            children: [
              AppToolbar(title: AppText.profile, drawerCallBack: () {

              }),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildBody() {
    return Expanded(
      child: ListView(
        children: [
          _buildProfile(),
          _buildPoint(),
          _buildTab(),
          _buildTabBarView(),
        ],
      ),
    );
  }
  Widget _buildProfile() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppColors.current.dimmedLight)),
      child: Center(
        child: Column(
          children: [
            Empty(
              height: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'assets/images/egypt.jpeg',
                fit: BoxFit.cover,
                width: 136,
                height: 136,
              ),
            ),
            const Text(
              'عاطف عبيد',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'محافظة كفر الشيخ',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.current.text,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const Text(
                  'قرية الزعفران',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Empty(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
  // Build MainPoint
  Widget _buildPoint() {
    return Container(
      height: 136,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.current.accent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_pointVillage(), _replaceablePoint(), _replacedPoint()],
        ),
      ),
    );
  }

  Widget _pointVillage() {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: AppColors.current.accent,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          AppText.pointVillage,
          style: TextStyle(color: AppColors.current.accent, fontSize: 14),
        ),
        const Spacer(flex: 1),
        Text('1600',
            style: TextStyle(
                color: AppColors.current.accent,
                fontWeight: FontWeight.normal,
                fontSize: 14)),
      ],
    );
  }

  Widget _replaceablePoint() {
    return Row(
      children: [
        Icon(
          Icons.airplane_ticket_sharp,
          color: AppColors.current.accent,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          AppText.replaceable,
          style: TextStyle(color: AppColors.current.accent, fontSize: 14),
        ),
        const Spacer(flex: 1),
        Text('1400',
            style: TextStyle(
                color: AppColors.current.accent,
                fontWeight: FontWeight.normal,
                fontSize: 14)),
      ],
    );
  }

  Widget _replacedPoint() {
    return Row(
      children: [
        Icon(
          Icons.adjust,
          color: AppColors.current.accent,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          AppText.replacedPoint,
          style: TextStyle(color: AppColors.current.accent, fontSize: 14),
        ),
        const Spacer(flex: 1),
        Text('200',
            style: TextStyle(
                color: AppColors.current.accent,
                fontWeight: FontWeight.normal,
                fontSize: 14)),
      ],
    );
  }

  /// Build Tabs
  Widget _buildTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ButtonsTabBar(
          height: 84,
          buttonMargin: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          labelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.current.background),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: AppColors.current.primary,
          unselectedBackgroundColor: AppColors.current.primary.withOpacity(0.2),
          unselectedLabelStyle: TextStyle(
            color: AppColors.current.primary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(
              text: AppText.information,
              // child: _buildTab(AppText.information,width: 64),
            ),
            Tab(
              text: AppText.education,
              //child: _buildTab(AppText.education,width: 48),
            ),
            Tab(
              text: AppText.practicalExperience,
              //child: _buildTab(AppText.practicalExperience,width: 90),
            ),
            Tab(
              text: AppText.earnPoints,
              //child: _buildTab(AppText.earnPoints,width: 90),
            ),
            Tab(
              text: AppText.replacingPrizes,
              // child: _buildTab(AppText.replacingPrizes,width: 96),
            ),
          ]),
    );
  }

  // TabBar view
  Widget _buildTabBarView() {
    return SizedBox(
      height: 400,
      child: TabBarView(
        children: [
          // first tab bar view widget
          _buildInformationTab(),
          // second tab bar view widget
          _buildEducationTab(),
          // third tab bar view widget
          _buildScientificExpertiseTab(),
          // fourth tab bar view widget
          _buildEarnPointsTab(),
          // five tab bar view widget
        _buildReplacePrizeTab(),
        ],
      ),
    );
  }
  /// Build TabBars views
  Widget _buildInformationTab() {
    return Form(
      key: _keyForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildName(),
            _buildNationalId(),
            _buildTitle(),
            _buildEmail(),
            _buildPhone(),
            _buildAddress(),
            _buildChangePassword(),
          ],
        ),
      ),
    );
  }
  Widget _buildEducationTab() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.current.primary.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.image,
                        color: AppColors.current.primary,
                        size: 36,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'كلية أداب - قسم مكتبات',
                      style: TextStyle(
                          color: AppColors.current.text,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'جامعة طنطا',
                      style: TextStyle(
                          color: AppColors.current.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '1992',
                      style: TextStyle(
                          color: AppColors.current.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.current.primary.withOpacity(0.2),
              thickness: 1,
              endIndent: 8,
              indent: 8,
            );
          },
          itemCount: 3),
    );
  }
  Widget _buildScientificExpertiseTab() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.current.primary.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.image,
                        color: AppColors.current.primary,
                        size: 36,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'شركة الابعاد الخمسة لتقنية المعلومات',
                      style: TextStyle(
                          color: AppColors.current.text,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'رئيس مجلس الإدارة',
                      style: TextStyle(
                          color: AppColors.current.text,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'فبراير 2022',
                          style: TextStyle(
                              color: AppColors.current.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' : ',
                          style: TextStyle(
                              color: AppColors.current.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'حتى الان',
                          style: TextStyle(
                              color: AppColors.current.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.current.primary.withOpacity(0.2),
              thickness: 1,
              endIndent: 8,
              indent: 8,
            );
          },
          itemCount: 3),
    );
  }
  Widget _buildEarnPointsTab() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'إجابة سؤال',
                      style: TextStyle(
                          color: AppColors.current.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'DDL-QUEST-0002009',
                      style: TextStyle(
                          color: AppColors.current.text,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '14.25 14 . الإثنين . فبراير 2022',
                      style: TextStyle(
                          color: AppColors.current.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.current.dimmed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Center(
                      child: Text('50',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),)),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.current.primary.withOpacity(0.2),
              thickness: 1,
              endIndent: 8,
              indent: 8,
            );
          },
          itemCount: 3),
    );
  }
  Widget _buildReplacePrizeTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 80,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                    //color: AppColors.current.primary.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.image,
                    color: AppColors.current.primary,
                    size: 72,
                  ),
                ),
                const SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'إجابة سؤال',
                      style: TextStyle(
                          color: AppColors.current.text,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'DDL-QUEST-0002009',
                      style: TextStyle(
                          color: AppColors.current.text,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '14.25 14 . الإثنين . فبراير 2022',
                      style: TextStyle(
                          color: AppColors.current.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 64,
                  height: 48,
                  decoration: BoxDecoration(
                      color: AppColors.current.dimmed.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Center(
                      child: Text('500',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),)),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.current.primary.withOpacity(0.2),
              thickness: 1,
              endIndent: 8,
              indent: 8,
            );
          },
          itemCount: 3),
    );
  }

 // Build TextFormed field in Tab Information
  Widget _buildName() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: TextFormField(
        decoration: InputDecoration(hintText: AppText.name),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onChanged: (val) => controller.name = val,
        validator: RequiredValidator(errorText: AppText.requiredField),
      ),
    );
  }
  Widget _buildNationalId() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: TextFormField(
        decoration: InputDecoration(hintText: AppText.nationalId),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        onChanged: (val) => controller.nationalId = val,
        validator: RequiredValidator(errorText: AppText.requiredField),
      ),
    );
  }
  Widget _buildTitle() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: TextFormField(
        decoration: InputDecoration(hintText: AppText.title),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        onChanged: (val) => controller.title = val,
        validator: RequiredValidator(errorText: AppText.requiredField),
      ),
    );
  }
  Widget _buildEmail() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: TextFormField(
        decoration: InputDecoration(hintText: AppText.email),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        onChanged: (val) => controller.email = val,
        validator: RequiredValidator(errorText: AppText.requiredField),
      ),
    );
  }
  Widget _buildPhone() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: TextFormField(
        decoration: InputDecoration(hintText: AppText.mobileNumber),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        onChanged: (val) => controller.phone = val,
        validator: RequiredValidator(errorText: AppText.requiredField),
      ),
    );
  }
  Widget _buildAddress() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: TextFormField(
        decoration: InputDecoration(hintText: AppText.location),
        keyboardType: TextInputType.streetAddress,
        textInputAction: TextInputAction.done,
        onChanged: (val) => controller.address = val,
        validator: RequiredValidator(errorText: AppText.requiredField),
      ),
    );
  }
  Widget _buildChangePassword() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: BigBtn(
        text: AppText.changePassword,
        onPressed: () => _onConfirm(),
      ),
    );
  }
  _onConfirm() {
    _keyForm.currentState?.save();
    if (_keyForm.currentState!.validate()) {
      controller.onConfirmClick();
    }
  }
}
