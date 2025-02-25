import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  required String title,
  required Widget icon,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300, // Replace with appropriate fixed or dynamic size
            maxHeight: 400,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const SizedBox(height: 28),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 22),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showErrorDialog(BuildContext context, String message) {
  return showCustomDialog(
    context: context,
    title: message,
    icon: Icon(
      Icons.error,
      color: AppColors.darkRed,
      size: 50,
    ),
  );
}
