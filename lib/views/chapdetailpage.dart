import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/jsondecode_model.dart';
import '../provider/json_decode.dart';

class ChapterDetailPage extends StatefulWidget {
  const ChapterDetailPage({Key? key}) : super(key: key);

  @override
  State<ChapterDetailPage> createState() => _ChapterDetailPageState();
}

class _ChapterDetailPageState extends State<ChapterDetailPage> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ShlokJsonDecodeProvider>(context, listen: false).loadJSON(
        Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
            .chapterJsonDecodeModel
            .allChapter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
              .chapterJsonDecodeModel
              .allChapter[chapterIndex]
              .nameTranslationEnglish,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/gitimage/${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[chapterIndex].imageName}.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Name Meaning",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
                    .chapterJsonDecodeModel
                    .allChapter[chapterIndex]
                    .nameMeaning,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Summary",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
                    .chapterJsonDecodeModel
                    .allChapter[chapterIndex]
                    .chapterSummaryEnglish,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('all_verses_page');
                  },
                  child: const Text("All Verses"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
