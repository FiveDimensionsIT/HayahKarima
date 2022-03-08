import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/shadow_view.dart';

class GridDetails extends StatelessWidget {
  const GridDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          children: [
            AppToolbar(
              title: AppText.back,
              backCallBack: () => Get.back(),
            ),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
        child: Padding(
      padding: AppTheme.pagePadding,
      child: SingleChildScrollView(
        child: Column(
          children: [

            _buildPrefCard(),

            const SizedBox(height: 20,),

            _buildDeadDate(),

            const SizedBox(height: 20,),

            _buildSpecialist(),

            const SizedBox(height: 20,),

            _buildDeadMercy(),

            const SizedBox(height: 25,),

            _buildGallery(),
          ],
        ),
      ),
    ));
  }

  Widget _buildPrefCard() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          border: Border.all(color: AppColors.current.dimmed.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          /// img
          SizedBox(
            width: Get.width / 3,
            height: Get.width / 3,
            child: ClipOval(
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRurCcJNZBSJYjDSCKTjj4vBTFhOs2A_810Rw&usqp=CAU'),
            ),
          ),

          /// name
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'أنور ابراهيم المنزلاوي',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline2?.fontSize),
            ),
          ),

          /// desc
          Text('مركز مطوبس - قرية منية المرشد', maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline4?.fontSize),),
        ],
      ),
    );
  }

  Widget _buildDeadDate() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          border: Border.all(color: AppColors.current.accent),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            Icons.date_range,
            color: AppColors.current.accent,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'تاريخ الوفاة',
            style: TextStyle(
                color: AppColors.current.accent,
                fontWeight: FontWeight.bold,
                fontSize: Get.textTheme.headline3?.fontSize),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            '22/10/1940',
            style: TextStyle(
                color: AppColors.current.accent,
                fontWeight: FontWeight.bold,
                fontSize: Get.textTheme.headline4?.fontSize),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialist() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          border: Border.all(color: AppColors.current.accent),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            Icons.school,
            color: AppColors.current.accent,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              'العلوم الحديثة',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.current.accent,
                  fontWeight: FontWeight.bold,
                  fontSize: Get.textTheme.headline3?.fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeadMercy() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(color: AppColors.current.primary, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          'ادع له بالرحمة',
          style: TextStyle(
              color: AppColors.current.neutral,
              fontWeight: FontWeight.bold,
              fontSize: Get.textTheme.headline3?.fontSize),
        ),
      ),
    );
  }

  Widget _buildGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معرض الصور',
          style: TextStyle(fontSize: Get.textTheme.headline2?.fontSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildGallerySlider(),
        const SizedBox(
          height: 10,
        ),
        Text(
          'ولد بمنية المرشد عام 1944، استدعي للخدمة باليمن أثناء تجنيده، لحماية ثورة الشعب ضد نظام البدر البدائي. ظل عامين باليمن ثم عاد إلى منية المرشد، وحصل على شهادة انتهاء خدمته، فتزوج وبدأ حياته المدنية، لكن إسرائيل هجمت على مصر في 5 يونيو 1967، واستدعي أنور كجندي احتياط. وطال انتظار الزوجة والأهل لعودته دون جدوى. وفي النهاية وصل الخبر رسميا باستشهاده. وكرمته الدولة بإطلاق اسمه على إحدى مدارس القرية مدرسة الشهيد المنزلاوي',
          style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _buildGallerySlider() {
    return CarouselSlider(
      options: CarouselOptions(height: Get.height / 3, initialPage: 0, viewportFraction: 0.8,),

      items: [1, 2, 3, 4, 5].map((i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: Get.height / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  ShadowView(
                    child: Image.network(
                      'https://media.istockphoto.com/photos/aerial-photograph-rural-landscape-farms-villages-picturesque-green-picture-id1292399669?b=1&k=20&m=1292399669&s=170667a&w=0&h=LQAbbZdgZVPntMvwUvMBwTuJkIU7JF6XP4sGe-Mq4o0=',
                      fit: BoxFit.cover,
                      height: Get.height / 3,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: AppColors.current.text.withOpacity(0.7),
                        child: Text(
                          'صور تعبر عن مدخل القرية',
                          style: TextStyle(color: AppColors.current.neutral),
                        ),
                      )),
                ],
              ),
          ),
        );
      }).toList(),
    );
  }
}
