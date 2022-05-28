import 'package:flutter/material.dart';


class ButtonItem extends StatelessWidget {
  final String title;
  final  Function? onButtonTap;
  const ButtonItem(
      {Key? key,
        required this.title,
         this.onButtonTap,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onButtonTap!(),
      child: Container(
        height: 48,
        alignment: Alignment.center,
        margin:const  EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF47321),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title,
        style:const TextStyle(
          color:  Color(0xFFFFFFFF),
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    ) ;
  }
}
