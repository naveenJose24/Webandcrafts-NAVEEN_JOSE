import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webandcrafts/Modules/ProfileDetails/view/widget/profile_details_widgets.dart';
import 'package:webandcrafts/Utils/theme.dart';

import '../../../Utils/Constants/text_constants.dart';
import '../../Home/model/profile_model.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({Key? key}) : super(key: key);
  ProfileModel profileData = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBoxColor,
        body: Column(
          children: [
            appBar(),
            profileImageWidget(profileData),
            const SizedBox(
              height: 30,
            ),
            Text(
              profileData.name.toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.w700, color: kFontColor),
            ),
            Text(
              profileData.email.toString(),
              style: GoogleFonts.abel(
                  fontSize: 20, fontWeight: FontWeight.w400, color: kFontColor),
            ),
            const SizedBox(
              height: 10,
            ),
            tileWidget(
                iconData: Icons.person,
                iconColor: kBlueColor,
                title: profileData.username != null
                    ? profileData.username.toString()
                    : '',
                subtitle: USER_NAME_SUBTITLE),
            tileWidget(
                iconData: Icons.web,
                iconColor: kTileIcon2Color,
                title: profileData.website != null
                    ? profileData.website.toString()
                    : '',
                subtitle: WEBSITE_SUBTITLE),
            tileWidget(
                iconData: Icons.phone,
                iconColor: kTileIcon3Color,
                title: profileData.phone != null
                    ? profileData.phone.toString()
                    : '',
                subtitle: PHONE_NUMBER_SUBTITLE),
            tileWidget(
                iconData: Icons.home,
                iconColor: kTileIcon4Color,
                title:
                    '${profileData.address!.street} ${profileData.address!.suite} ${profileData.address!.city} ${profileData.address!.zipcode}',
                subtitle: ADDRESS_SUBTITLE),
            tileWidget(
                iconData: Icons.work_outline,
                iconColor: kCircleBackgroundColor,
                title: profileData.company != null
                    ? '${profileData.company!.name} ${profileData.company!.catchPhrase} ${profileData.company!.bs}'
                    : '',
                subtitle: COMPANY_SUBTITLE)
          ],
        ),
      ),
    );
  }
}
