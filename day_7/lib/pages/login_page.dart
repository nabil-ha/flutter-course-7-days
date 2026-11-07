import 'package:day_7/extensions.dart';
import 'package:day_7/l10n/app_localizations.dart';
import 'package:day_7/models/user.dart';
import 'package:day_7/pages/dashboards/dashboard_page.dart';
import 'package:day_7/providers/language_provider.dart';
import 'package:day_7/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserRole userRole = UserRole.Admin;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(context.loc.login),
          actionsPadding: EdgeInsets.all(8),
          actions: [
            Consumer<LanguageProvider>(
              builder: (context, value, child) {
                String lang = value.lang;
                return IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    value.changeLang(lang == "en" ? "ar" : "en");
                  },
                  icon: Text(
                    lang == "en" ? "عربية" : "English",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.loc.welcomePleaseLogin),
              // Manual
              DropdownButton(
                value: userRole,
                items: [
                  DropdownMenuItem(
                    child: Text(context.loc.partner),
                    value: UserRole.Partner,
                  ),
                  DropdownMenuItem(
                    child: Text(context.loc.client),
                    value: UserRole.Client,
                  ),
                  DropdownMenuItem(
                    child: Text(context.loc.operation),
                    value: UserRole.Operation,
                  ),
                  DropdownMenuItem(
                    child: Text(context.loc.admin),
                    value: UserRole.Admin,
                  ),
                ],
                onChanged: (value) {
                  userRole = value!;
                  setState(() {});
                },
              ),
              // Shortcut
              // DropdownButton(
              //   value: userRole,
              //   items: UserRole.values
              //       .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              //       .toList(),
              //   onChanged: (value) {
              //     // setState(() {
              //     //   userRole = value!;
              //     // });
              //   },
              //   isDense: true,
              // ),
              ElevatedButton(
                onPressed: () {
                  value.setUserRole(userRole);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                    // (route) => false,
                  );
                },
                child: Text(context.loc.goToDashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
