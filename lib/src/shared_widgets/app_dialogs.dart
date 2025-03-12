import 'package:flutter/material.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'package:standard_project/src/extenssions/widget_extensions.dart';

import '../../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import 'searching_truck_loading.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  required Widget title,
  Widget? icon,
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
                icon ?? SizedBox(),
                28.verticalSpace,
                title
                // Text(
                //   title,
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context)
                //       .textTheme
                //       .displayLarge!
                //       .copyWith(fontSize: 22),
                // ),
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
    title: Text(message),
    icon: Icon(
      Icons.error,
      color: AppColors.darkRed,
      size: 50,
    ),
  );
}

Future<void> showTruckDetailsDialog({
  required BuildContext context,
  required String weight,
  required String scales,
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
            maxWidth: 320,
            maxHeight: 350,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 22,
                  ),
                  splashColor: AppColors.lightGray,
                  padding: EdgeInsets.zero,
                  alignment: AlignmentDirectional.topStart,
                  onPressed: () => Navigator.pop(context),
                ),
                _truckRow(context),
                8.verticalSpace,
                _customeDivider(),
                _infoRow(context, "سعة المركبة", "$weight kg"),
                _customeDivider(),
                _infoRow(context, "حجم المركبة", scales),
              ],
            ),
          ),
        ),
      );
    },
  );
}

_customeDivider() => Divider(
      color: AppColors.lightGray,
      height: 1,
    );

_truckRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Assets.icons.truck.svg(),
      Text(
        "سطحة",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],
  ).onlyPadding(bottom: 16);
}

Widget _infoRow(BuildContext context, String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(value, style: Theme.of(context).textTheme.bodyMedium),
      Text(label, style: Theme.of(context).textTheme.bodyMedium),
    ],
  ).symmetricPadding(vertical: 16);
}

Future<void> showSearchingTruckLoading({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    useSafeArea: false,
    builder: (BuildContext context) {
      return SearchingTruckLoading();
    },
  );
}
