import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';

class CardFormValidator {
  static String? Function(String?) cardHolderNameValidators(
      BuildContext context) {
    return qValidator([
      IsRequired(context.tr('card_holder_name_required')),
      MinLength(2, context.tr('nameValidatorMessage')),
    ]);
  }

  static String? Function(String?) cardNumberValidators(BuildContext context) {
    return qValidator([
      IsRequired(context.tr('card_number_required')),
      MinLength(16, context.tr('card_number_invalid')),
      // MaxLength(19, context.tr('card_number_invalid')),
    ]);
  }

  static String? Function(String?) expiryDateValidators(BuildContext context) {
    return qValidator([
      IsRequired(context.tr('expiry_date_required')),
      MinLength(5, context.tr('expiry_date_invalid')),
      QRule(
        (value) {
          if (value.isEmpty) return false;
          if (!RegExp(r'^\d{2}/\d{4}$').hasMatch(value)) return false;

          final month = int.tryParse(value.substring(0, 2));
          final year = int.tryParse(value.substring(3));

          if (month == null || month < 1 || month > 12) return false;
          if (year == null || year < 1000 || year > 3000) return false;

          // Optional: Check if expiry date is in the future
          final now = DateTime.now();
          final expiryDate = DateTime(year, month + 1); // end of expiry month
          return expiryDate.isAfter(now);
        },
        context.tr('expiry_date_invalid'),
      ),
    ]);
  }

  static String? Function(String?) cvcValidators(BuildContext context) {
    return qValidator([
      IsRequired(context.tr('cvc_required')),
      MinLength(3, context.tr('cvc_invalid')),
      MaxLength(4, context.tr('cvc_invalid')),
    ]);
  }
}
