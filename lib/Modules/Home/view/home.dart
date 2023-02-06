import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webandcrafts/Modules/Home/controller/home_controller.dart';
import 'package:webandcrafts/Modules/Home/model/profile_model.dart';

import '../../../Utils/theme.dart';
import 'widget/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        backgroundColor: kBoxColor,
        body: homeController.showLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : listTileWidget(homeController),
      );
    });
  }
}
