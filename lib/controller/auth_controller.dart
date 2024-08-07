import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/model/user_model.dart';
import 'package:test/view/dashboard.dart';
import 'package:test/view/sign_in.dart';

class AuthController extends GetxController {
  final Rx<User?> _user = Rx<User?>(null);
  final RxBool _isSignedIn = false.obs;

  User? get user => _user.value;
  bool get isSignedIn => _isSignedIn.value;

  void createUser(String id, String name, String email, String password) {
    _user.value = User(id: id, name: name, email: email, password: password);
    Get.snackbar("Success", "User Created Successfully");
    Get.to(SignIn());
  }


  void signIn(String email, String password) async {
    if (_user.value != null && _user.value!.email == email && _user.value!.password == password) {
      _isSignedIn.value = true;
      Get.snackbar('Success', 'Signed in successfully');
      Get.off(DashboardScreen());
      await _saveUserSession(_user.value!);
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }

  void signOut() {
    _isSignedIn.value = false;
    _clearUserSession();
    Get.snackbar('Success', 'Signed out successfully');
    Get.off(SignIn());
  }

  Future<void> _saveUserSession(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', user.id);
    await prefs.setString('userName', user.name);
    await prefs.setString('userEmail', user.email);
    await prefs.setString('userPassword', user.password); 
  }

   Future<void> _clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    await prefs.remove('userName');
    await prefs.remove('userEmail');
    await prefs.remove('userPassword');
  }

  void clearUser() {
    _user.value = null;
    _isSignedIn.value = false;
  }
}