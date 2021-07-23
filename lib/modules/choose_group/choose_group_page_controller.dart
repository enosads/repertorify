import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:repertorify/shared/context/user_context.dart';
import 'package:repertorify/shared/models/group_model.dart';
import 'package:repertorify/shared/routes/app_pages.dart';

class ChooseGroupPageController extends GetxController {
  final loaded = false.obs;
  List<GroupModel> groups = [];

  @override
  void onInit() {
    super.onInit();
    _fetchGroups();
  }

  _fetchGroups() async {
    once(UserContext.to.loaded, (value) async {
      final groupsDocuments = await FirebaseFirestore.instance
          .collection('groups')
          .where('members', arrayContains: UserContext.to.user.ref)
          .get();
      groupsDocuments.docs
          .forEach((group) => groups.add(GroupModel.fromSnapshot(group)));
      loaded.value = true;
    });
  }

  void handleJoinGroupCode() {
    Get.toNamed(Routes.JOIN_GROUP_CODE);
  }

  handleChooseGroup(int index) {}

  static ChooseGroupPageController get to => Get.find();
}
