import 'package:flutter/material.dart';
import 'package:webandcrafts/Modules/Home/controller/home_controller.dart';

import '../../model/profile_model.dart';

listTileWidget(homeController){
  return ListView.separated(
    itemCount: homeController.profileData.length,
    separatorBuilder: (context, index) {
      return const SizedBox(height: 10,);

    },
    itemBuilder: (context, index) {
      ProfileModel profileData = homeController.profileData[index];
      return ListTile(
        leading: CircleAvatar(
          backgroundImage:
          NetworkImage(profileData.profileImage.toString()),
        ),
        title: Text(profileData.name),
      );

    },

  );
}
