import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:repertorify/shared/models/member_model.dart';
import 'package:repertorify/shared/utils/app_shared_preferences.dart';
import 'package:repertorify/shared/utils/app_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserContext extends GetxController {
  final loaded = false.obs;
  late MemberModel user;

  @override
  void onInit() {
    super.onInit();
    _initializeUser().catchError((e) => AppToast.error(e.toString()));
  }

  _initializeUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userIdFromPrefs = prefs.getString(AppSharedPrefs.CURRENT_USER_REF);
    if (userIdFromPrefs != null) {
      final firebaseUserDocument = await FirebaseFirestore.instance
          .collection('users')
          .doc(userIdFromPrefs)
          .get();
      user = MemberModel.fromSnapshot(firebaseUserDocument);
      loaded.value = true;
    } else {
      throw Exception('Não foi possível carregar usuário');
    }
  }

  static UserContext get to => Get.find();
}
