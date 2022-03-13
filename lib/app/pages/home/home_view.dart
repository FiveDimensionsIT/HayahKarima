import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class HomeView extends StatelessWidget {
  var controller = Get.find<HomeController>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //drawer: SideMenuView(),
      backgroundColor: AppColors.current.neutral,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          /// toolbar.
          AppToolbar(
            title: AppText.homePage,
            drawerCallBack: () => scaffoldKey.currentState?.openDrawer(),
          ),
          _buildAlContent(),
        ],
      ),
    );
  }
  Widget _buildAlContent(){
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppTheme.pagePadding,
          child: Column(
            children: [
              _buildWhatThink(),
              Empty(height: 24,),
              _buildHomeData(),
              Empty(height: 24,),
              _buildHomeData(),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildWhatThink(){
    return Container(
      width: double.infinity,
      height: 136,
      padding: AppTheme.pagePadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: AppColors.current.dimmed.withOpacity(0.5),
              width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppText.whatIsInYourMind,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.current.dimmed.withOpacity(0.5),
            ),
          ),
          _buildButtonWhatThank(),
        ],
      ),
    );
}
  Widget _buildButtonWhatThank() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildButtonThank(
            title: AppText.image,
            colorIcon: AppColors.current.primary,
            icon: const Icon(Icons.image),
            color: AppColors.current.background,
            colorText: AppColors.current.primary,
            onPress: () {}),
        _buildButtonThank(
            title: AppText.activate,
            colorIcon: AppColors.current.accent,
            icon: const Icon(Icons.mood),
            color: AppColors.current.background,
            colorText: AppColors.current.accent,
            onPress: () {}),
        _buildButtonThank(
            title: AppText.live,
            colorIcon: AppColors.current.error,
            icon: const Icon(Icons.app_shortcut_rounded),
            color: AppColors.current.background,
            colorText: AppColors.current.error,
            onPress: () {}),
      ],
    );
  }
  Widget _buildButtonThank({title, icon, color, onPress, colorIcon, colorText}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: colorIcon,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          minimumSize: const Size(36, 36),
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: colorText,
          ),
        ),
        onPressed: onPress,
        icon: icon,
        label: Text(
          title,
        ),
      ),
    );
  }

  Widget _buildHomeData(){
    return Container(

      padding: AppTheme.pagePadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: AppColors.current.accent,
              width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 64,height: 72,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.current.dimmed,
                  // image: DecorationImage(
                  //   image: AssetImage('assets/images/icon_user.png')
                  // )
                ),
                child: Image.asset(
                  'assets/images/icon_user.png',
                  width: 48,
                  height: 48,
                  fit: BoxFit.contain,
                ),
              ),
              Empty(width: 16,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('مسعد العربى',
                    maxLines: 1,
                    softWrap: true,
                    style: TextStyle(
                        color: AppColors.current.text,
                        fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                  Text('14 الاثنين.فبراير 2022',
                    style: TextStyle(
                        color: AppColors.current.primary,
                        fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],),
              const Spacer(),
              Text("...",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.current.dimmed,
                    letterSpacing: 1
                ),
                textAlign: TextAlign.end,
              )
            ],
          ),
          Empty(height: 18,),
          const Text('خلال فترة حكم محمد علي، استطاع أن ينهض بمصر عسكريًا وتعليميًا وصناعيًا وزراعيًا وتجاريًا، مما جعل من مصر دولة ذات ثقل في تلك الفترة،',
           maxLines: 4,
            softWrap: true,
          ),
          Empty(height: 12,),
          Container(
              width: 96,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.current.accent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text('مثل شعبي',
              style: TextStyle(color: AppColors.current.accent,fontWeight: FontWeight.bold),
              ),
          ),
          Empty(height: 12,),
          CarouselSlider(
            items: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/egypt.jpeg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ],
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
            ),
          ),
          Empty(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              _buildRates('457', Icons.access_time_filled),
              _buildRates('457', Icons.message),
              _buildRates('254',Icons.star),
              _buildRates('123',Icons.share)
          ],
          ),
           Divider(color: AppColors.current.background,indent: 12,endIndent: 12,thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            _buildButton(Icons.ten_mp,'أعجبنى'),
            _buildButton(Icons.message,'تعليق'),
            _buildButton(Icons.share,'مشاركة'),
          ],),
        ],
      ),
    );
  }


  Widget _buildButton(icon,title){
    return Container(
      width: 92,
      height: 36,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12),
        color: AppColors.current.neutral,
        border: Border.all(width: 2,color: AppColors.current.accent)
      ),
      child: InkWell(
        onTap: (){

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon,color: AppColors.current.accent,),
            Text(title,style: TextStyle(color: AppColors.current.accent),)
          ],
        ),
      ),
    );
  }
  Widget _buildRates(title,icon){
    return Container(
      width: 64,
      height: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.current.neutral,
          //border: Border.all(width: 2,color: AppColors.current.accent)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title,style: TextStyle(color: AppColors.current.primary),),
          Icon(icon,color: AppColors.current.primary,),
        ],
      ),
    );
  }
}
