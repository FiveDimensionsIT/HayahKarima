import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/utils/ui/empty.dart';


class MyVillageView extends StatelessWidget {
  const MyVillageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body:SafeArea(
        child: Column(
          children: [
            AppToolbar(title:AppText.myVillage,
                drawerCallBack: (){}),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(){
    return Expanded(
      child: ListView(
      children: [
              _buildProfile(),
              _buildPoint(CupertinoIcons.star_lefthalf_fill,AppText.pointVillage,213521,
                  AppColors.current.accent),
              Empty(height: 16,),
              _buildPoint(Icons.accessibility,AppText.people,241221,
                  AppColors.current.primary),
                 _buildGallery(),
        _buildStoryAndPeople(title:AppText.people,descr: 'أنشئت القرية عام 1912 باسم الأبعادية القبلية، وفي عام 1925 تم تغيير اسمها إلى اسمها الحالي، وذلك لأن أراضيها كانت ملك الحكومة المصرية، وباعتها الحكومة إلى الملك فؤاد الأول، واشترت بثمن الأراض سراي الزعفران بالقاهرة، لذلك رأت الخاصة الملكية تسمية البلدة بالزعفران إحياء لذكرى سراي الزعفران التي أعطيت بدلاً منها'),
        _buildStoryAndPeople(title: AppText.date,descr: 'بلغ عدد سكان الزعفران 22240 نسمة حسب الإحصاء الرسمى لعام 2006.')
      ],
      ),
    );
  }

  Widget _buildProfile(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            width: 1,
            color: AppColors.current.dimmedLight)
      ),
      child: Center(
        child: Column(
        children: [
          Empty(height: 16,),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/icon_user.png'),
            radius: 64,

          ),
          const Text('قرية الزعفران',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text('مركز الحامول',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
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
              const Text('محافظة كفر الشيخ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
          ],
          ),
          Empty(height: 16,)
        ],
        ),
      ),
    );
  }
  Widget _buildPoint(icon,String title ,int number,Color color){
    return Container(
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 1,
              color: AppColors.current.dimmedLight),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(icon,color: color,),
            const SizedBox(width: 16,),
            Text(title,style: TextStyle(color: color,fontSize: 14),),
            const Spacer(flex: 1),
            Text(number.toString(),style:TextStyle(
              color: color,
              fontWeight: FontWeight.normal,
              fontSize: 14
            )),
          ],
        ),
      ),
    );
  }
  Widget _buildGallery (){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8),
          child: Text(AppText.photoGallery,
          style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        CarouselSlider(items: [
         ClipRRect(
           borderRadius: BorderRadius.circular(20.0),
           child: Image.asset(
             'assets/images/egypt.jpeg',
            fit: BoxFit.cover,
           ),
         ),
        ],
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
          ),
        ),
      ],
    );
  }
  Widget _buildStoryAndPeople({@required String? title,@required String? descr}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8),
          child: Text(title!,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24.0),
             child: Text(descr!,
               maxLines: 14,softWrap: true,),
           ),
      ],
    );
  }
}
