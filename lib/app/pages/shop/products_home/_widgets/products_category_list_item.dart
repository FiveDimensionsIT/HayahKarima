import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/product_category_title';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/product_item.dart';
import 'package:hayah_karema/app/pages/shop/products_home/_widgets/show_more.dart';

class ProductsCategoryListItem extends StatelessWidget {
  final Function onProductItemClick;
  final Function onProductTitleClick;
  final String title;
  final String companyName;
  final dynamic price;
  final dynamic rate;
  final String photo;
  final int productListLength;
  const ProductsCategoryListItem({Key? key, required this.onProductItemClick, required this.onProductTitleClick,required this.title, required this.companyName, required this.price,required this.rate,required this.photo,required this.productListLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// general item of see all
        _buildCategoryTitle("هواتف جوالات سامسونج وأبل جديدة 2022"),

        /// main item of the screen
        _buildCategoryList(),
      ],
    );
  }

  SizedBox _buildCategoryList() {
    return SizedBox(
      height: 275.h,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize16),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) =>
          i == productListLength
              ? InkWell(
              onTap: () => onProductTitleClick(),
              child: const ShowMore())
              : ProductItem(
            onItemTap: () => onProductItemClick(),
            companyName: companyName,
            price: price,
            title: title,
            rate: rate,
            photo: photo
            //"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80",
          ),
          separatorBuilder: (_, __) => const SizedBox(
            width: 16,
          ),
          itemCount:
          productListLength >3 ?
              4
              :
          productListLength + 1),
    );
  }

  ProductCategoryTitle _buildCategoryTitle(String title) {
    return ProductCategoryTitle(
      title: title,
      onSeeAllTap: ()=> onProductTitleClick()
    );
  }
}
