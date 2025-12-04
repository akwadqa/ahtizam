import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:queen_validators/queen_validators.dart';

class ProfileNameFormField extends StatelessWidget {
  final TextEditingController controller;

  const ProfileNameFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("full_name"),
          style:
              Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
        ).onlyPadding(start: 8),
        8.verticalSpace,
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 14, color: AppColors.black800),

            decoration: InputDecoration(
              suffix: Assets.icons.profile.svg(
                color: AppColors.gray,
                height: 25,
              ),
              hintText: context.tr('full_name'),
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 14, color: AppColors.grey600),
            ),
            textInputAction: TextInputAction.next,
            validator: qValidator([
              IsRequired(context.tr('required')),
            ]),
            keyboardType: TextInputType.name,
            // onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
