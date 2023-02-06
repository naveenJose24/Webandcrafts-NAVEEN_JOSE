import 'package:get/get.dart';
import 'package:webandcrafts/Modules/Home/view/home.dart';
import 'package:webandcrafts/Modules/ProfileDetails/view/profile_details.dart';

part './routes.dart';

class Pages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () =>  HomeScreen()),
    GetPage(name: Routes.PROFILE_DETAILS, page: () => const ProfileDetailsScreen()),

  ];
}
