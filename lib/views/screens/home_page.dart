import 'package:depature_app/model/jsondecode_model.dart';
import 'package:depature_app/provider/json_decode.dart';
import 'package:depature_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
        .loadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bhagwat Gita",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: (Provider.of<ThemeProvider>(context).themeModel.isDark)
                ? Icon(Icons.nightlight)
                : Icon(Icons.light_mode),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<ChapterJsonDecodeProvider>(context)
            .chapterJsonDecodeModel
            .allChapter
            .length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            onTap: () {
              chapterIndex = index;
              Navigator.of(context).pushNamed("chap_detail_page");
            },
            leading: Text(
                "${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].id}"),
            title: Text(
              Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
                  .chapterJsonDecodeModel
                  .allChapter[index]
                  .nameHindi,
            ),
            subtitle: Text(
                "Verses : ${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].versesCount}"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
