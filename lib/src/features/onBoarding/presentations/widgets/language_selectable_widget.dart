import 'package:flutter/material.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'package:standard_project/src/theme/app_colors.dart';

class LanguageSelectableWidget extends StatelessWidget {
  final String currentLanguage;
  final Function(String newLanguage) onLanguageChange;
  const LanguageSelectableWidget({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildChooseText(context),
        GestureDetector(
          onTap: () {
            if (currentLanguage != 'ar') {
              onLanguageChange('ar');
            }
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: currentLanguage == 'ar'
                  ? AppColors.black
                  : Colors.transparent,
              border: Border.all(color: AppColors.grayBorder),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: Text('العربية',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: currentLanguage == 'ar'
                            ? AppColors.white
                            : Colors.black,
                      )),
            ),
          ),
        ),
        15.verticalSpace,
        GestureDetector(
          onTap: () {
            if (currentLanguage != 'en') {
              onLanguageChange('en');
            }
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: currentLanguage == 'en'
                  ? AppColors.black
                  : Colors.transparent,
              border: Border.all(color: AppColors.grayBorder),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: Text('English',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: currentLanguage == 'en'
                            ? AppColors.white
                            : Colors.black,
                      )),
            ),
          ),
        ),
      ],
    );
  }

  _buildChooseText(BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "إختر اللغة",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            2.verticalSpace,
            Text(
              "select language",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 14, color: AppColors.gray),
            ),
            15.verticalSpace,
          ],
        ),
      );
}
