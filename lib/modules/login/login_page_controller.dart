import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/choose_group/choose_group_page.dart';
import 'package:repertorify/shared/routes/app_pages.dart';
import 'package:repertorify/shared/services/firebase_auth_service.dart';
import 'package:repertorify/shared/theme/app_colors.dart';
import 'package:repertorify/shared/utils/app_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  final logging = false.obs;

  @override
  void onInit() {
    Firebase.initializeApp();
    super.onInit();
  }

  handleGoogleSignIn() async {
    FirebaseAuthService.signInWithGoogle()
        .then(_assertUserExists)
        .then(_saveUserToPrefs)
        .then((value) => Get.toNamed(Routes.CHOOSE_GROUP))
        .catchError(_handleError);
  }

  _assertUserExists(User? firebaseAuthUser) async {
    if (firebaseAuthUser == null) {
      throw Exception("Não foi possível fazer login");
    }
    final doc = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuthUser.uid);
    final user = await doc.get();
    if (!user.exists) {
      doc.set({
        "name": firebaseAuthUser.displayName,
        "avatarUrl": firebaseAuthUser.photoURL,
        "email": firebaseAuthUser.email,
      });
    }
    return firebaseAuthUser.uid;
  }

  static LoginPageController get to => Get.find();

  _handleError(e) {
    Get.snackbar('Error', e.toString(),
        backgroundColor: AppColors.red, colorText: AppColors.white);
  }

  _saveUserToPrefs(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppSharedPrefs.CURRENT_USER_REF, value);
  }
}
