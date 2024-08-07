import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/auth_controller.dart';
import 'package:test/view/sign_in.dart';

class SignUp extends StatelessWidget {
  final AuthController userController = Get.put(AuthController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0, right:8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textField("Name",
                  onchanged: (value) => nameController.text = value),
              textField("Email Id",
                  onchanged: (value) => emailController.text = value),
              textField("Password",
                  onchanged: (value) => passController.text = value),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  userController.createUser('1', nameController.text,
                      emailController.text, passController.text);
                },
                child: const Text('Create User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
