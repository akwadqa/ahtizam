import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared_widgets/custom_appbar.dart';

@RoutePage()
class RecomendedQuestionPage extends StatelessWidget {
  RecomendedQuestionPage({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: "recomended_question"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.verticalSpace,
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
                  fillColor: AppColors.lightGray,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.gray,
                    size: 20,
                  ),
                  hintText: context.tr('search'),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontSize: 14, color: AppColors.gray),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
                // onSaved: onSaved,
              ),
            ),
            20.verticalSpace,
            Text(
              "title of test ",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.dark,
                  ),
            ),
            30.verticalSpace,
            Text(
              "test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test ",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    // color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
