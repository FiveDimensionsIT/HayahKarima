import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
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
  RxString errorText = ''.obs;
  final RxString texHint = ''.obs;
  int _sliderPageIndex = 0;
  Timer? typingSpeed;
  Timer? counterTimer;
  RxString speedValue = ''.obs;

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
    typingSpeed?.cancel();
    counterTimer?.cancel();
    super.onClose();
  }

  void _initData() {
    levelsList.add(SpellingIlliteracyModel(level: 1,
        points: 10,
        speed: 5,
        isSelected: true,
        contentList: [
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

    levelsList.add(SpellingIlliteracyModel(level: 2,
        points: 20,
        speed: 10,
        isSelected: false,
        contentList: [
          ContentModel(
            name: 'محمد',
            voice: '',
          ),
          ContentModel(
            name: 'ابراهيم',
            voice: '',
          ),
        ]));

    levelsList.add(SpellingIlliteracyModel(level: 3,
        points: 30,
        speed: 20,
        isSelected: false,
        contentList: [
          ContentModel(
            name: 'الشهيد احمد المنسي',
            voice: '',
          ),
          ContentModel(
            name: 'حياة كريمة الرقمية',
            voice: '',
          ),
          ContentModel(
            name: 'نادي القراء المحترفين',
            voice: '',
          ),
        ]));

    updateSelectedLevel();
    getHintName();
    startTimer();
  }

  void startTimer() {
    if (typingSpeed != null) typingSpeed!.cancel();
    if (counterTimer != null) counterTimer!.cancel();

    int counter = selectedLevel!.value.speed;
    speedValue.value = '$counter';
    counterTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (counter == 0) counter = selectedLevel!.value.speed;
      speedValue.value = '$counter';
      counter--;
    });
    typingSpeed = Timer.periodic(Duration(seconds: selectedLevel!.value.speed), (timer) {
      onNextClick();
    });
  }

  void onLevelChanged({SpellingIlliteracyModel? level}) {
    textEditingController.clear();
    sliderController.jumpToPage(0);
    levelsList
        .firstWhere((element) => element.isSelected)
        .isSelected = false;
    levelsList
        .firstWhere((element) => element.level == level!.level)
        .isSelected = true;

    updateSelectedLevel();
    getHintName();
    startTimer();
  }

  void updateSelectedLevel() {
    onSliderChangeIndex(pageIndex: 0);
    if (selectedLevel == null) {
      selectedLevel = levelsList
          .firstWhere((element) => element.isSelected)
          .obs;
    } else {
      selectedLevel!.value = levelsList.firstWhere((element) => element.isSelected);
    }
  }

  void onNextClick() async {
    if (textEditingController.text.isEmpty) return;
    if (textEditingController.text == _selectedWord().name) {
      await audioPlayer.setSourceAsset(AppAssets.rightAnswerSound);
      totalPoints.value += selectedLevel!.value.points;

      onSliderChangeIndex(pageIndex: ++_sliderPageIndex);

      if (_sliderPageIndex >= selectedLevel!.value.contentList.length) {
        typingSpeed?.cancel();
        counterTimer?.cancel();
        return;
      }

      sliderController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      getHintName();
      errorText.value = '';
      await Future.delayed(const Duration(milliseconds: 400));
      textEditingController.clear();
    } else {
      errorText.value = 'حاول مرة آخرى'.tr;
      await audioPlayer.setSourceAsset(AppAssets.wrongAnswerSound);
    }
  }

  ContentModel _selectedWord() {
    print('==> sliderPageIndex : $_sliderPageIndex && contentListLength: ${selectedLevel!.value.contentList.length}');
    if(_sliderPageIndex >= selectedLevel!.value.contentList.length){
      return  selectedLevel!.value.contentList.last;
    }
    return selectedLevel!.value.contentList[_sliderPageIndex];
  }

  void onSliderChangeIndex({required int pageIndex}) {
    _sliderPageIndex = pageIndex;
  }

  void getHintName() {
    final item = _selectedWord();
    String name = item.name.trim();
    final nameList = name.split(" ");
    String hint = '';
    nameList.map((name) {
      String namedCharacter = '';
      List.generate(name.length, (index) => namedCharacter += '-');
      hint += '$namedCharacter ';
    }).toList();
    texHint.value = hint.trim();
  }

  void onTextEditingChange(String value) {
    if(value.isEmpty || _selectedWord().name.length != value.length) errorText.value = '';
    if(_selectedWord().name.length == value.length){
      onNextClick();
      startTimer();
    }
  }
}

class SpellingIlliteracyModel {
  late int level;
  late int points;
  late int speed;
  late bool isSelected;
  late List<ContentModel> contentList;

  SpellingIlliteracyModel({required this.level,
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
