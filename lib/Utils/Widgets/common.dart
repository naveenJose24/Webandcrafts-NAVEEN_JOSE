import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

/// flutter toast widget
showFlutterToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
      textColor: Colors.white,
      fontSize: 16.0);
}

/// cachedNetworkImage widget
cachedNetworkImage(
    {required double width,
    required double height,
    required String imageUrl,
    required String placeholderImage,
    required double borderWidth,
    Color borderColor = kBoxColor}) {
  return CachedNetworkImage(
    width: width,
    height: height,
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: borderWidth > 0
            ? Border.all(
                width: borderWidth,
                color: borderColor,
              )
            : null,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.contain,
        ),
      ),
    ),
    placeholder: (context, url) => Opacity(
      opacity: 0.2,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: borderWidth > 0
              ? Border.all(
                  width: borderWidth,
                  color: borderColor,
                )
              : null,
          image: DecorationImage(
            image: AssetImage(placeholderImage),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
    errorWidget: (context, url, error) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: borderWidth > 0
            ? Border.all(
                width: borderWidth,
                color: borderColor,
              )
            : null,
        image: DecorationImage(
          image: AssetImage(placeholderImage),
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
/// no item
noItem() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:  [
      const SizedBox(
        height: 60,
        width: 60,
        child: Icon(Icons.person)
      ),
      Text("No profile found !",style: GoogleFonts.montserrat(
  fontWeight: FontWeight.w700),)
    ],
  );
}
