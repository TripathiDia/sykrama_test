

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/view/sign_up.dart';
import '../controller/auth_controller.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
     final emailController = TextEditingController();
  final passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 
   Column(
            children: [
              textField("Email Id",
                  onchanged: (value) => emailController.text = value),
              textField("Password",
                  onchanged: (value) => passController.text = value),
              const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => controller.signIn(emailController.text, passController.text),
                  child: const Text('Sign In'),
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("OR", style: TextStyle(color: Colors.black54)),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonButton('Facebook', Icons.abc),
                  commonButton('Google', Icons.abc),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                   Get.to(() => SignUp());
                },
                child: const Text('Create an Account'),
              ),
            ],
          )

      ),
    );
  }

  Widget commonButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () { },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

 Widget textField(label, {onchanged}) {
    return TextField(
      onChanged: onchanged,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.emailAddress,
      
    );
  }
