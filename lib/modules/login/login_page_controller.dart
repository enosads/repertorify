import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/choose_group/choose_group_page.dart';
import 'package:repertorify/shared/services/firebase_auth_service.dart';
import 'package:repertorify/shared/theme/app_colors.dart';

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
        .then((value) => Get.to(ChooseGroupPage()))
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
  }

  static LoginPageController get to => Get.find();

  _handleError(e) {
    Get.snackbar('Error', e.toString(),
        backgroundColor: AppColors.red, colorText: AppColors.white);
  }
}
