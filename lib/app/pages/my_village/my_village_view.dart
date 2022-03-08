import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/utils/ui/empty.dart';


class MyVillageView extends StatelessWidget {
  const MyVillageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return SafeArea(
      child: Column(
      children: [
        AppToolbar(title: 'قريتى',
             drawerCallBack: (){}),
            _buildProfile(),
            Empty(height: 16,),
            _buildPoint(Icons.accessibility,'قرية الزعفران',221),
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
            children: const[
            Text('مركز الحامول',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('0'),
              ),
              Text('محافظة كفر الشيخ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
          ],
          ),
          Empty(height: 16,)
        ],
        ),
      ),
    );
  }
  Widget _buildPoint(icon,String title ,int number){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 1,
              color: AppColors.current.dimmedLight),
      ),
      child: Row(
        children: [
          Icon(icon,color: AppColors.current.accent,),
          Text(title,style: TextStyle(color: AppColors.current.accent,),),
          Container(
              width: 148,
              child: Text(number.toString(),textAlign: TextAlign.end,),
          )
        ],
      ),
    );
  }
}
