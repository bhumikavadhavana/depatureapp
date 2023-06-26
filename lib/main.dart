import 'package:depature_app/model/theme_model.dart';
import 'package:depature_app/provider/json_decode.dart';
import 'package:depature_app/provider/theme_provider.dart';
import 'package:depature_app/views/chapdetailpage.dart';
import 'package:depature_app/views/screens/allverses.dart';
import 'package:depature_app/views/screens/home_page.dart';
import 'package:depature_app/views/screens/shlok_details.dart';
import 'package:depature_app/views/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isDark = preferences.getBool('appTheme') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(
              isDark: isDark,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ChapterJsonDecodeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShlokJsonDecodeProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        routes: {
          '/': (context) => splashscreen(),
          'home_page': (context) => homePage(),
          'chap_detail_page': (context) => ChapterDetailPage(),
          'all_verses_page': (context) => AllVersesPage(),
          'shlok_detail_page': (context) => ShlokDetailPage(),
        },
      ),
    ),
  );
}
