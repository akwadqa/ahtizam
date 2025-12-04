import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? title;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final void Function(String)? onSaved;
  final int? maxLength;
  final int? maxLines;
  final bool readOnly;
  final bool enabled;
  final TextAlign textAlign;
  final EdgeInsets? contentPadding;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? hintColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hint,
    this.title,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.maxLines = 1,
    this.readOnly = false,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.height,
    this.width,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.hintColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            context.tr(title!),
            style:
                Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 15),
          ).onlyPadding(start: 8, bottom: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLength: maxLength,
          maxLines: maxLines,
          readOnly: readOnly,
          enabled: enabled,
          textAlign: textAlign,
          style: TextStyle(
            color: textColor ?? AppColors.black,
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 14, color: AppColors.grey600),
            prefixIcon: prefix,
            suffixIcon: suffix,
            contentPadding:
                contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
            // border: InputBorder.none,
            counterText: '',
          ),
          textInputAction: TextInputAction.next,
          onChanged: onChanged,
          onSaved: (value) {
            if (onSaved != null && value != null) {
              onSaved!(value);
            }
          },
        ),
      ],
    );
  }
}
