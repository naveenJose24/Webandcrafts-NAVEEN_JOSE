import 'package:get/get.dart';
import 'package:webandcrafts/Utils/Constants/text_constants.dart';
import 'package:webandcrafts/Utils/Widgets/common.dart';

import '../provider/home_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController {
  var showLoading = true;
  var profileData;
  var profileResponse;

  @override
  void onInit() {
    super.onInit();
    manageData();
  }

  getProfile(box) {
    HomeProvider().fetchProfileData().then((data) async {
      profileData = data;
      box.put('profile',profileData);
      showLoading = false;
      update();
    });
  }

  manageData()  {
    var box =  Hive.box(PROFILE_BOX);
    if (box.length > 0) {
      var profileResponse = box.get('profile');
      profileData = profileResponse!;
      showLoading = false;
      showFlutterToast('data loaded from storage');
      update();
    } else {
      getProfile(box);
      showFlutterToast('data loaded from API');
    }
  }
}
