import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:repertorify/shared/models/group_model.dart';
import 'package:repertorify/shared/utils/app_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupContext extends GetxController {
  final loaded = false.obs;
  GroupModel? group;

  @override
  void onInit() {
    super.onInit();
    _initializeGroup();
  }

  _initializeGroup() async {
    final prefs = await SharedPreferences.getInstance();
    final groupId = prefs.getString(AppSharedPrefs.SELECTED_GROUP);
    if (groupId != null) {
      final firebaseGroupDocument = await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupId)
          .get();
      group = GroupModel.fromSnapshot(firebaseGroupDocument);
    }
    loaded.value = true;
  }

  static GroupContext get to => Get.find();
}
