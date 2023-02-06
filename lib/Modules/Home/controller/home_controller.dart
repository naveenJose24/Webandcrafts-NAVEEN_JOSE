import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webandcrafts/Utils/Constants/text_constants.dart';
import 'package:webandcrafts/Utils/Widgets/common.dart';

import '../model/profile_model.dart';
import '../provider/home_provider.dart';

class HomeController extends GetxController {
  var showLoading = true;
  var profileData = [];
  late List<ProfileModel> profileResponse;

  @override
  void onInit() {
    super.onInit();
    manageProfileData();
  }

  getProfile(box) {
    HomeProvider().fetchProfileData().then((data) async {
      profileData = data;
      box.write(PROFILE_KEY, profileModelToJson(data));
      print('------------FROM STORAGE--------------------');
      print(box.read(PROFILE_KEY));
      print('--------------------------------');

      showLoading = false;
      update();
    });
  }

  manageProfileData() {
    final box = GetStorage(PROFILE_BOX);
    if (box.read(PROFILE_KEY) != null) {
      profileResponse =
          profileModelFromJson(json.decode(box.read(PROFILE_KEY)));
      profileData = profileResponse;
      showFlutterToast('data loaded from storage');
      update();
    } else {
      getProfile(box);
      showFlutterToast('data loaded from API');
    }
  }
}
