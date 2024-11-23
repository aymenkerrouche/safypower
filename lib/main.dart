import 'package:fintech_dashboard_clone/screen/Login_Screen.dart';
import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/provider/STATIONProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => STATIONProvider(),
        ),
      ],
      child: const FintechDasboardApp(),
    ),
  );
}

class FintechDasboardApp extends StatelessWidget {
  const FintechDasboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
        scrollbarTheme: Styles.scrollbarTheme,
      ),
      //home: const ProfileScreen(),
      //  home: const Forgotpwd(),
      home: const LoginScreen(),
      //  home: const SignupScreen(),
    );
  }
}
