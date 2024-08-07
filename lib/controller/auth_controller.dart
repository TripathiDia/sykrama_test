import 'package:get/get.dart';
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

  void signIn(String email, String password) {
    if (_user.value != null && _user.value!.email == email && _user.value!.password == password) {
      _isSignedIn.value = true;
      Get.snackbar('Success', 'Signed in successfully');
      Get.to(DashboardScreen());
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }

  void signOut() {
    _isSignedIn.value = false;
    Get.snackbar('Success', 'Signed out successfully');
    Get.off(SignIn());
  }

  void clearUser() {
    _user.value = null;
    _isSignedIn.value = false;
  }
}