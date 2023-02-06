import 'package:get/get.dart';

import '../../../Utils/Constants/text_constants.dart';
import '../model/profile_model.dart';
import '../provider/home_provider.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  var showLoading = true;
  var profileData = [];
  Box<ProfileModel>? profileBox;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    // profileBox = Hive.box<ProfileModel>(PROFILE_BOX);
    // if(profileBox!.isEmpty){
    //   getProfile();
    // }else{
    //
    // }
  }

  getProfile() {
    HomeProvider().fetchProfileData().then((data) async {
      profileData = data;
      // for(var i in data){
      //   await profileBox!.put(i.id,i);
      // }
      showLoading = false;
      update();
    });
  }
}
