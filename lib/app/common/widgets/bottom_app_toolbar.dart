import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';

class BottomAppToolbar extends StatelessWidget {



  BottomAppToolbar(
      {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, top: 5),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: AppColors.current.dimmed.withOpacity(0.15),
                blurRadius: 3,
                offset: const Offset(6, 0))
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Text('hhhhh'),
              Text('ggggg'),
              Text('bbbbb'),
            ],
          ),
          SizedBox(height: 24,),
          _buildLoginButton(),
        ],
      ),
    );
  }
  BigBtn _buildLoginButton() {
    return BigBtn(
      //state: controller.loginLoading.value? BtnState.loading: BtnState.active,
      text: AppText.login,
      onPressed: () => null,
    );
  }
}
