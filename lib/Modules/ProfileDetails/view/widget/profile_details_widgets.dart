import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Utils/Constants/image_constants.dart';
import '../../../../Utils/Widgets/common.dart';
import '../../../../Utils/theme.dart';

appBar() {
  return Row(
    children: [
      IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_sharp,
          semanticLabel: "Back",
          size: 20,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      const SizedBox(
        width: 20,
      ),
    ],
  );
}
profileImageWidget(profileData){
  return cachedNetworkImage(
      width: 165,
      height: 165,
      imageUrl: profileData.profileImage.toString(),
      borderColor: Colors.white12,
      placeholderImage: PLACEHOLDER_ICON,
      borderWidth: 2);
}

tileWidget({required iconData, required title, required subtitle,required iconColor}) {
  return ListTile(
    leading: SizedBox(
      height: 50,
      width: 50,
      child: Card(
          elevation: 2,
          color: kCardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Icon(
            iconData,
            color: iconColor.withOpacity(0.5),
          )),
    ),
    title: Text(
      title.toString().isNotEmpty ? title: '---',
      style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
    ),
    subtitle: Text(
      subtitle.toString().isNotEmpty ? subtitle: '---',
      style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
    ),
  );
}
