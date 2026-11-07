import 'package:day_7/l10n/app_localizations.dart';
import 'package:day_7/pages/login_page.dart';

import 'package:day_7/providers/data_provider.dart';
import 'package:day_7/providers/language_provider.dart';
import 'package:day_7/providers/project_provider.dart';
import 'package:day_7/providers/user_provider.dart';
import 'package:day_7/providers/document_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<ProjectProvider>(
          create: (_) => ProjectProvider(),
        ),
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
        ChangeNotifierProvider<DocumentProvider>(
          create: (_) => DocumentProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade300,
          appBarTheme: AppBarThemeData(backgroundColor: Colors.grey.shade300),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
          ),
          cardTheme: CardThemeData(color: Colors.grey.shade500),

          fontFamily: "IBMPlexSansArabic",
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        locale: Locale(value.lang),
        supportedLocales: [Locale('en'), Locale('ar')],
        home: LoginPage(),
      ),
    );
  }
}
