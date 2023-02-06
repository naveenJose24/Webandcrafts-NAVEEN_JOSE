import 'package:get/get.dart';

import '../provider/home_provider.dart';

class HomeController extends GetxController {
  var showLoading = true;
  var profileData = [];
  // Box<WooProductDetails>? favouritesBox;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    // favouritesBox = Hive.box<WooProductDetails>(FAVOURITE_BOX);
  }

  getProfile() {
    HomeProvider().fetchProfileData().then((data) async {
      profileData = data;
      showLoading = false;
      update();
    });
  }
}
