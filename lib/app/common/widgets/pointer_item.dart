import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointerItem extends StatelessWidget {
  final String title, subtitle;
  final double percentage;
  final Color itemBackGround;

  const PointerItem(
      {Key? key, required this.title, required this.subtitle, required this.percentage, required this.itemBackGround})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItem();
  }

  Widget _buildItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: itemBackGround.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: itemBackGround, fontWeight: FontWeight.bold),
                ),
              )),
              Text(
                subtitle,
                style: TextStyle(color: itemBackGround, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            width: Get.width * percentage,
            height: 3,
            decoration: BoxDecoration(
              color: itemBackGround,
              borderRadius: BorderRadius.circular(5),
            ),
          )
        ],
      ),
    );
  }
}
