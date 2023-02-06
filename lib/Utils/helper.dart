import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_page/search_page.dart';
import 'package:webandcrafts/Modules/Home/model/profile_model.dart';
import 'package:webandcrafts/Utils/theme.dart';

import '../Routes/pages.dart';
import 'Widgets/common.dart';

String getInitials(name) {
  List<String> names = name.split(" ");
  String initials = "";
  int numWords = 2;

  if (numWords < names.length) {
    numWords = names.length;
  }
  for (var i = 0; i < numWords; i++) {
    initials += names[i][0];
  }
  return initials;
}

searchProduct(context, homeController) {
  return showSearch(
    context: context,
    delegate: SearchPage<ProfileModel>(
      items: homeController.profileData,
      searchLabel: 'Search product',
      barTheme: ThemeData.from(
          colorScheme: const ColorScheme(
              primary: kBoxColor,
              secondary: kTileIcon3Color,
              surface: kBoxColor,
              background: kBoxColor,
              error: kBoxColor,
              onPrimary: kFontColor,
              onSecondary: kFontColor,
              onSurface: kFontColor,
              onBackground: kBoxColor,
              onError: kFontColor,
              brightness: Brightness.light)),
      suggestion: const Center(
        child: Text(''),
      ),
      failure: Center(
        child: noItem(),
      ),
      filter: (profile) => [
        profile.name.toString(), profile.email.toString(),
      ],
      builder: (profile) => InkWell(
        onTap: () {
          Get.toNamed(Routes.PROFILE_DETAILS, arguments: [profile]);
        },
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
                title: Text(profile.name.toString()),
                leading: profileImage(profile)
                // subtitle: Text(person.surname),
                // trailing: Text('${person.age} yo'),
                ),
            const Divider(
              color: kLineColor,
              thickness: 1,
            ),
          ],
        ),
      ),
    ),
  );
}

profileImage(ProfileModel profile) {
  return profile.profileImage != null
      ? Image.network(profile.profileImage.toString())
      : Container(
    color: kCircleBackgroundColor,
        width: 60,
        height: 60,
        child: Center(
          child: Text(
              getInitials(profile.name.toString()),
              style:
                  GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 13),
            ),
        ),
      );
}
