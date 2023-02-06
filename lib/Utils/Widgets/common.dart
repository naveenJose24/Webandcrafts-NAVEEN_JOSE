import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      required double borderRadius,
      required String placeholderImage,
      required double borderWidth,
      Color borderColor = kBoxColor}) {
  return CachedNetworkImage(
    width: width,
    height: height,
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        border: borderWidth > 0
            ? Border.all(
          width: borderWidth,
          color: borderColor,
        )
            : null,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => Opacity(
      opacity: 0.2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          border: borderWidth > 0
              ? Border.all(
            width: borderWidth,
            color: borderColor,
          )
              : null,
          image: DecorationImage(
            image: AssetImage(placeholderImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    errorWidget: (context, url, error) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        border: borderWidth > 0
            ? Border.all(
          width: borderWidth,
          color: borderColor,
        )
            : null,
        image: DecorationImage(
          image: AssetImage(placeholderImage),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}