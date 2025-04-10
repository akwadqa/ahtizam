import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:queen_validators/queen_validators.dart';

class ProfileEmailFormField extends StatelessWidget {
  final TextEditingController controller;

  const ProfileEmailFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("email"),
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
              suffix: Icon(
                Icons.email_outlined,
                color: AppColors.gray,
                size: 25,
              ),
              hintText: context.tr('email'),
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 14, color: AppColors.grey600),
            ),
            textInputAction: TextInputAction.next,
            validator: qValidator([
              IsRequired(context.tr('required')),
              IsEmail(context.tr('emailValidatorMessage'))
            ]),
            keyboardType: TextInputType.emailAddress,
            // onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
