import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:flutter/services.dart';

import '../../../../../utils/app_validation.dart';
import '../../../../../utils/arabic_number_input_formatter.dart';

class ProfilePhoneFormField extends StatelessWidget {
  final TextEditingController controller;

  const ProfilePhoneFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("phone_number"),
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
                Icons.phone_iphone,
                color: AppColors.gray,
                size: 25,
              ),
              hintText: context.tr('phone_number'),
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 14, color: AppColors.grey600),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              ArabicNumberInputFormatter(),
            ],
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            validator: mobileNumberValidation(context),
            // onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
