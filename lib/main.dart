import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Modules/Home/model/profile_model.dart';
import 'Routes/pages.dart';
import 'Utils/Constants/text_constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Hive.initFlutter();
  Hive.registerAdapter(ProfileModelAdapter());
  await Hive.openBox<ProfileModel>(PROFILE_BOX);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      getPages: Pages.pages,
      initialRoute: Routes.HOME,
    ),
  );
}
