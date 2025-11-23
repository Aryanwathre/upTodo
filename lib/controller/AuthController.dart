import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../app/routes/Routes.dart';
import '../services/firebase/firebase_auth_service.dart';

class AuthController extends GetxController {
  final FirebaseAuthService _service = FirebaseAuthService();

  final Rxn<User> firebaseUser = Rxn<User>();
  var isLoading = false.obs;

  @override
  void onInit() {
    firebaseUser.bindStream(_service.authStateChanges().map((u) => u));
    ever<User?>(firebaseUser, _handleAuthChanged);
    super.onInit();
  }

  void _handleAuthChanged(User? user) {
    if (user == null) {
      if (Get.currentRoute != Routes.login) {
        Get.offAllNamed(Routes.login);
      }
    } else {
      if (Get.currentRoute != Routes.todoList) {
        Get.offAllNamed(Routes.todoList);
      }
    }
  }

  Future<void> login({
        required String email,
        required String password,
      }) async {
    try {
      isLoading.value = true;
      await _service.signInWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login failed', e.message ?? e.code);
    } catch (e) {
      Get.snackbar('Login failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      await _service.createUserWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Signup failed', e.message ?? e.code);
    } catch (e) {
      Get.snackbar('Signup failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await _service.signOut();
    } catch (e) {
      Get.snackbar('Logout error', e.toString());
    }
  }
}
