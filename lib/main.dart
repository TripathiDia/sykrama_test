import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/controller/auth_controller.dart';
import 'package:test/view/dashboard.dart';
import 'package:test/view/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController authController = Get.put(AuthController());

  bool userLoggedIn = false;

  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString('username');

    if (username != null) {
      userLoggedIn = true;
      setState(() {});
    } else {
      userLoggedIn = false;
      setState(() {});

      Get.to(SignIn());
    }
  }

  @override
  void initState() {
    super.initState();
    checkToken();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Synkrama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: userLoggedIn ? DashboardScreen() : SignIn(), //SignIn(),
    );
  }
}
