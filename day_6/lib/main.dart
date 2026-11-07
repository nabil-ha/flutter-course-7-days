import 'package:day_6/pages/login_page.dart';
import 'package:day_6/pages/notification_tutorial_page.dart';

import 'package:day_6/providers/data_provider.dart';
import 'package:day_6/providers/lang_provider.dart';
import 'package:day_6/providers/project_provider.dart';
import 'package:day_6/providers/user_provider.dart';
import 'package:day_6/providers/document_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

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
        ChangeNotifierProvider<LangProvider>(create: (_) => LangProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LangProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          locale: Locale(value.lang),
          supportedLocales: const [
            Locale("ar"),
            Locale("en"),
            Locale("ur"),
            Locale("bn"),
          ],
          home: NotificationTutorialPage(),
        );
      },
    );
  }
}
