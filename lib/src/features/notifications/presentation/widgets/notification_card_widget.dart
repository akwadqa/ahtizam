import 'dart:math';

import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/shared_widgets/circle_image_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NotificationCardWidget extends StatelessWidget {
  final String driverName;
  final String message;
  final String time;
  final String imageUrl;

  const NotificationCardWidget({
    required this.driverName,
    required this.message,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          CircleImageWidget(imageUrl: imageUrl),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: driverName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' $message'),
                    ],
                  ),
                ),
                4.verticalSpace,
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
