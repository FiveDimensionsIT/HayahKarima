import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';

class SpellingIlliteracyController extends GetxController {
  final RxList<SpellingIlliteracyModel> levelsList = <SpellingIlliteracyModel>[].obs;
  final RxInt totalPoints = 0.obs;
  final sliderController = PageController();
  final AudioPlayer audioPlayer = AudioPlayer();
  final textEditingController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  Rx<SpellingIlliteracyModel>? selectedLevel;
  int _carouselPageIndex = 0;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    textEditingController.dispose();
    sliderController.dispose();
    focusNode.dispose();
    timer?.cancel();
    super.onClose();
  }

  void _initData() {
    levelsList.add(SpellingIlliteracyModel(level: 1, points: 10, speed: 3, isSelected: true, contentList: [
      ContentModel(
        name: 'أ',
        voice: '',
      ),
      ContentModel(
        name: 'ب',
        voice: '',
      ),
      ContentModel(
        name: 'ت',
        voice: '',
      ),
      ContentModel(
        name: 'ث',
        voice: '',
      ),
      ContentModel(
        name: 'ج',
        voice: '',
      ),
      ContentModel(
        name: 'ح',
        voice: '',
      ),
      ContentModel(
        name: 'خ',
        voice: '',
      ),
      ContentModel(
        name: 'د',
        voice: '',
      ),
      ContentModel(
        name: 'ذ',
        voice: '',
      ),
      ContentModel(
        name: 'ر',
        voice: '',
      ),
      ContentModel(
        name: 'ز',
        voice: '',
      ),
      ContentModel(
        name: 'س',
        voice: '',
      ),
      ContentModel(
        name: 'ش',
        voice: '',
      ),
      ContentModel(
        name: 'ص',
        voice: '',
      ),
      ContentModel(
        name: 'ض',
        voice: '',
      ),
      ContentModel(
        name: 'ط',
        voice: '',
      ),
      ContentModel(
        name: 'ظ',
        voice: '',
      ),
      ContentModel(
        name: 'ع',
        voice: '',
      ),
      ContentModel(
        name: 'غ',
        voice: '',
      ),
      ContentModel(
        name: 'ف',
        voice: '',
      ),
      ContentModel(
        name: 'ق',
        voice: '',
      ),
      ContentModel(
        name: 'ك',
        voice: '',
      ),
      ContentModel(
        name: 'ل',
        voice: '',
      ),
      ContentModel(
        name: 'م',
        voice: '',
      ),
      ContentModel(
        name: 'ن',
        voice: '',
      ),
      ContentModel(
        name: 'ه',
        voice: '',
      ),
      ContentModel(
        name: 'و',
        voice: '',
      ),
      ContentModel(
        name: 'ي',
        voice: '',
      ),
    ]));

    levelsList.add(SpellingIlliteracyModel(level: 3, points: 30, speed: 20, isSelected: false, contentList: [
      ContentModel(
        name: 'محمد',
        voice: '',
      ),
      ContentModel(
        name: 'ابراهيم',
        voice: '',
      ),
      ContentModel(
        name: 'احمد المنسي',
        voice: '',
      ),
      ContentModel(
        name: 'الشهيد احمد المنسي',
        voice: '',
      ),
    ]));

    updateSelectedLevel();
  }

  void onLevelChanged({SpellingIlliteracyModel? level}) {
    textEditingController.clear();
    levelsList.firstWhere((element) => element.isSelected).isSelected = false;
    levelsList.firstWhere((element) => element.level == level!.level).isSelected = true;
    updateSelectedLevel();
  }

  void updateSelectedLevel() {
    _carouselPageIndex = 0;
    if (selectedLevel == null) {
      selectedLevel = levelsList.firstWhere((element) => element.isSelected).obs;
    } else {
      selectedLevel!.value = levelsList.firstWhere((element) => element.isSelected);
    }

    timer = Timer.periodic(Duration(seconds: selectedLevel!.value.speed), (timer) => onNextClick());
  }

  void onNextClick() async {
    final item = selectedLevel!.value.contentList[_carouselPageIndex];
    if (textEditingController.text == item.name) {
      await audioPlayer.setSourceAsset(AppAssets.rightAnswerSound);
      textEditingController.clear();
      sliderController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      totalPoints.value += selectedLevel!.value.points;
    } else {
      await audioPlayer.setSourceAsset(AppAssets.wrongAnswerSound);
    }
  }

  void onSliderChangeIndex({required int pageIndex}) {
    _carouselPageIndex = pageIndex;
  }

  String getHintName() {
    final item = selectedLevel!.value.contentList[_carouselPageIndex];
    String name = item.name.trim();
    final nameList = name.split(" ");
    String hint = '';
    nameList.map((name) {
      String namedCharacter = '';
      List.generate(name.length, (index) => namedCharacter += '-');
      hint += '$namedCharacter ';
    }).toList();
    return hint;
  }
}

class SpellingIlliteracyModel {
  late int level;
  late int points;
  late int speed;
  late bool isSelected;
  late List<ContentModel> contentList;

  SpellingIlliteracyModel(
      {required this.level,
      required this.points,
      required this.contentList,
      required this.speed,
      required this.isSelected});
}

class ContentModel {
  late String name;
  late String voice;

  ContentModel({required this.name, required this.voice});
}
