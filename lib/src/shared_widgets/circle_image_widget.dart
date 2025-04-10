import 'dart:math';

import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? circleWidth;
  const CircleImageWidget(
      {super.key,
      required this.imageUrl,
      this.height,
      this.width,
      this.circleWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: min(height ?? 125, height ?? 125) / 2,
        height: min(width ?? 125, width ?? 125) / 2,
        decoration: BoxDecoration(
          color: AppColors.gray,
          shape: BoxShape.circle,

          // borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.black,
            width: circleWidth ?? 2,
          ),
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (_, __, ___) {
              return Icon(
                Icons.person,
                color: Colors.white,
                size: 50,
              );
            },
          ),
        ));
  }
}
