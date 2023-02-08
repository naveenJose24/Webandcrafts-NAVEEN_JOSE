import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Routes/pages.dart';
import '../../../../Utils/Constants/text_constants.dart';
import '../../../../Utils/helper.dart';
import '../../../../Utils/theme.dart';
import '../../model/profile_model.dart';


appBar(context, homeController){
  return AppBar(
    title: Text(
      PROFILE_APPBAR_TITLE,
      style: GoogleFonts.montserrat(fontWeight: FontWeight.w700,),
    ),
    actions:  [
      Padding(
        padding: const EdgeInsets.only(right:  5.0),
        child: IconButton(onPressed: () {
          searchProduct(context, homeController);
        }, icon:const Icon(CupertinoIcons.search, color: kBoxColor)),
      ),
    ],
  );
}

listTileWidget(homeController) {
  return RefreshIndicator(
    onRefresh: () async{
      homeController.manageData();
    },
    child: ListView.separated(
      itemCount: homeController.profileData.length,

      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemBuilder: (context, index) {
        ProfileModel profileData = homeController.profileData[index];
        return ListTile(
          onTap: () {
            Get.toNamed(Routes.PROFILE_DETAILS, arguments: [profileData]);
          },
          leading: profileImage(profileData),
          title: Text(
            profileData.name.toString(),
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(profileData.company !=null ?
            profileData.company!.name.toString() :'',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        );
      },
    ),
  );
}

profileImage(profileData) {
  return profileData.profileImage != null
      ? CircleAvatar(
          backgroundImage:
              CachedNetworkImageProvider(profileData.profileImage.toString()))
      : CircleAvatar(
          backgroundColor: kCircleBackgroundColor,
          child: Text(
            getInitials(profileData.name.toString()),
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, fontSize: 12),
          ),
        );
}
