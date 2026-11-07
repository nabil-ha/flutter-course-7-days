import 'package:day_5/pages/login_page.dart';

import 'package:day_5/providers/data_provider.dart';
import 'package:day_5/providers/project_provider.dart';
import 'package:day_5/providers/user_provider.dart';
import 'package:day_5/providers/document_provider.dart';
import 'package:flutter/material.dart';
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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: LoginPage(),
    );
  }
}
