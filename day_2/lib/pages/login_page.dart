import 'package:day_2/models/user.dart';
import 'package:day_2/pages/dashboards/admin_dashboard.dart';
import 'package:day_2/pages/dashboards/client_dashboard.dart';
import 'package:day_2/pages/dashboards/operation_dashboard.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserRole userRole = UserRole.Admin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, please log in"),
            // Manual
            DropdownButton(
              value: userRole,
              items: [
                DropdownMenuItem(
                  child: Text("Partner"),
                  value: UserRole.Partner,
                ),
                DropdownMenuItem(child: Text("Client"), value: UserRole.Client),
                DropdownMenuItem(
                  child: Text("Operation"),
                  value: UserRole.Operation,
                ),
                DropdownMenuItem(child: Text("Admin"), value: UserRole.Admin),
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
                if (userRole == UserRole.Admin) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminDashboard()),
                  );
                } else if (userRole == UserRole.Client) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ClientDashboard()),
                  );
                } else if (userRole == UserRole.Operation) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OperationDashboard(),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ClientDashboard()),
                  );
                }
              },
              child: Text("Go to dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
