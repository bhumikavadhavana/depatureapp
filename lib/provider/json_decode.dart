import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/details_model.dart';
import '../model/jsondecode_model.dart';
import '../model/lan_model.dart';

class ChapterJsonDecodeProvider extends ChangeNotifier {
  ChapterJsonDecodeModel chapterJsonDecodeModel = ChapterJsonDecodeModel(
    data: '',
    decodedList: [],
    allChapter: [],
  );

  Future<void> loadJSON() async {
    chapterJsonDecodeModel.data =
    await rootBundle.loadString('lib/json/all_chapters.json');

    chapterJsonDecodeModel.decodedList =
        jsonDecode(chapterJsonDecodeModel.data);

    chapterJsonDecodeModel.allChapter = chapterJsonDecodeModel.decodedList
        .map(
          (e) => AllChapterModel.fromMap(
        data: e,
      ),
    )
        .toList();
    notifyListeners();
  }
}

class ShlokJsonDecodeProvider extends ChangeNotifier {
  ShlokJsonDecodeModel shlokJsonDecodeModel = ShlokJsonDecodeModel(
    data: '',
    decodedList: [],
    allShloks: [],
  );

  Future<void> loadJSON(List list) async {
    shlokJsonDecodeModel.data =
    await rootBundle.loadString(list[chapterIndex].jsonPath);

    shlokJsonDecodeModel.decodedList = jsonDecode(shlokJsonDecodeModel.data);

    shlokJsonDecodeModel.allShloks = shlokJsonDecodeModel.decodedList
        .map(
          (e) => ChapterModel.fromMap(
        data: e,
      ),
    )
        .toList();
    notifyListeners();
  }

  englishLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].english;
    notifyListeners();
  }

  hindiLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].hindi;
    notifyListeners();
  }

  gujaratiLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].gujarati;
    notifyListeners();
  }
}
