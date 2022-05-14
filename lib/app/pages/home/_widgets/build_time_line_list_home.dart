import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/home/_widgets/time_line_item_view.dart';
import 'package:hayah_karema/app/pages/home/_widgets/timeline_question_item_view.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class BuildTimeLineListHome extends StatelessWidget {

  var controller = Get.find<HomeController>();
  final int index;
   BuildTimeLineListHome({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineItemView(item: controller.timelinePostsList[index]),

        if(index==1)Obx(() {
          if (controller.questionApiLoading.value) return const SizedBox(height: 30, width : 30,child: CircularProgressIndicator(strokeWidth: 3,));
          if (controller.questionsList.isEmpty) return const SizedBox();
          return Column(
            children: [
              Empty(height: 10),
              TimelineQuestionItemView(questions: controller.questionsList),
            ],
          );
        }),
      ],
    );
  }
}
