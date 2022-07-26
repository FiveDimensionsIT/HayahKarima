import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

import '../../../../common/managers/api/shop/_models/poduct_details_model.dart';

class ProductDetailItem extends StatelessWidget {
  final String title;
  final String companyName;
  final String price;
  final String description;
  //final String photo;
  final List<Images?>? images;
  //final  Function? onItemTap;
  const ProductDetailItem(
      {Key? key,
         required this.title,
         required this.price,
         required  this.companyName,
      //  required this.photo,
         required this.description,
        this.images,
        // this.onItemTap,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24,),
        SizedBox(
          height: 224,
          width: double.infinity,
          child:
          CarouselSlider(
            items:
            images?.map<Widget>((images) {
              return Builder(
                builder: (BuildContext context) {
                  return   Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0x1F000000)),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(images?.filename ?? "",fit: BoxFit.fill, height: 224,width: 296,
                            errorBuilder: (_, __, ___) {
                              return Container(
                                  width: Get.width,
                                  height: Get.height / 4,
                                  padding: const EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10), color: AppColors.current.dimmedLight),
                                  child: Image.asset(AppAssets.logo, color: AppColors.current.dimmed.withOpacity(0.3)));
                            },
                          )));
                },
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: .84,
              height: 224,
              disableCenter: true,
              enlargeStrategy:CenterPageEnlargeStrategy.scale ,
              aspectRatio: 296/ 224,
              initialPage: 0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
              scrollPhysics:const ClampingScrollPhysics(),
              onPageChanged: (int index, reason) {},
            ),
          ),
        ),
        const SizedBox(height: 16,),
        Padding(padding:const EdgeInsets.symmetric(horizontal: 16),
        child: Text(title,
          style:  TextStyle(
            fontSize: 22,
            color:   AppColors.current.text1,//Color(0xFF363535),
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
        const SizedBox(height: 16,),
        Padding(padding:const EdgeInsets.symmetric(horizontal: 16),
          child: Text(companyName,
            style:  TextStyle(
              fontSize: 14,
              color:   AppColors.current.text1,//Color(0xFF363535),
            ),
          ),
        ),
        const SizedBox(height: 16,),
        Padding(padding:const EdgeInsets.symmetric(horizontal: 16),
          child:  Text("$price ${AppText.pound}",
            style:  TextStyle(
              fontSize: 22,
            color:  AppColors.current.accent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Padding(padding:const EdgeInsets.symmetric(horizontal: 16),
          child:  Text(AppText.productDescription,
            style:  TextStyle(
              fontSize: 22,
              color:  AppColors.current.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height:16,),
        Padding(padding:const EdgeInsets.symmetric(horizontal: 16),
          child: Text(description,
            style:  TextStyle(
              fontSize: 18,
              color:   AppColors.current.text1,//Color(0xFF363535),
            ),
          ),
        ),
        const SizedBox(height:16,),
        Padding(padding:const EdgeInsets.symmetric(horizontal: 16),
          child:  Text(AppText.ratings,
            style:  TextStyle(
              fontSize: 22,
              color:  AppColors.current.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
