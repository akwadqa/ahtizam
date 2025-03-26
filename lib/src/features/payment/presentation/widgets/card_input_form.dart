import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queen_validators/queen_validators.dart';
import '../../../../shared_widgets/custom_text_field.dart';
import '../../../../shared_widgets/text_input_formatter.dart';
import '../../../../utils/validators/card_form_validator.dart';

class CardInputForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController cardHolderController;
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvcController;

  const CardInputForm({
    super.key,
    required this.formKey,
    required this.cardHolderController,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvcController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: cardHolderController,
            hint: 'Lamine yamal',
            title: 'card_holder_name'.tr(),
            validator: CardFormValidator.cardHolderNameValidators(context),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: cardNumberController,
            hint: '---- ---- ----',
            title: 'card_number'.tr(),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter(),
            ],
            validator: CardFormValidator.cardNumberValidators(context),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: expiryDateController,
                  hint: 'mm/yyyy',
                  title: 'expiry_date'.tr(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                    ExpiryDateInputFormatter(),
                  ],
                  validator: CardFormValidator.expiryDateValidators(context),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  controller: cvcController,
                  hint: '****',
                  title: 'CVC',
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  validator: CardFormValidator.cvcValidators(context),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
