import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/auth_controller.dart';
import 'package:test/view/terms_condition.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthController userController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();
  bool _termsAccepted = false;

  void _submit() {
    if (_termsAccepted) {
      if (_formKey.currentState!.validate()) {
        userController.createUser(
            '1', nameController.text, emailController.text, passController.text);
      }
    } else {
      Get.snackbar(
        'Error',
        'You need to accept the terms and conditions',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height:70),
                ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height:20),
                textField(
                  "Name",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                textField(
                  "Email Id",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                textField(
                  "Password",
                  controller: passController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                textField(
                  "Confirm Password",
                  controller: confirmController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CheckboxListTile(
                  title: GestureDetector(
                    onTap: () {
                      Get.to(TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'I accept the Terms and Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  onPressed: _submit,
                  child: const Text('Create Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(String hintText,
      {required TextEditingController controller, required String? Function(String?) validator, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
      ),
    );
  }
}














// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test/controller/auth_controller.dart';
// import 'package:test/view/terms_condition.dart';

// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final AuthController userController = Get.put(AuthController());
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//   final confirmController = TextEditingController();
//   bool _termsAccepted = false;

//   void _submit() {
//     if (_termsAccepted) {
//       userController.createUser(
//           '1', nameController.text, emailController.text, passController.text);
//     } else {
//       Get.snackbar(
//         'Error',
//         'You need to accept the terms and conditions',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign Up')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               textField("Name",
//                   onchanged: (value) => nameController.text = value),
//               textField("Email Id",
//                   onchanged: (value) => emailController.text = value),
//               textField("Password",
//                   onchanged: (value) => passController.text = value,
//                   obscureText: true),
//               const SizedBox(height: 10),
//               CheckboxListTile(
//                 title: GestureDetector(
//                   onTap: () {
//                     Get.to(TermsAndConditionsScreen());
//                   },
//                   child: const Text(
//                     'I accept the Terms and Conditions',
//                     style: TextStyle(
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//                 value: _termsAccepted,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     _termsAccepted = value ?? false;
//                   });
//                 },
//                 controlAffinity: ListTileControlAffinity.leading,
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: _submit,
//                 child: const Text('Create User'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget textField(String hintText,
//       {required Function(String) onchanged, bool obscureText = false}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           hintText: hintText,
//           border: const OutlineInputBorder(),
//         ),
//         onChanged: onchanged,
//       ),
//     );
//   }
// }
