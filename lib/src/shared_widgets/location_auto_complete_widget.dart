import 'package:flutter/material.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:standard_project/src/constants/Api/services_urls.dart';
import 'package:standard_project/src/theme/app_colors.dart';

class LocationAutoCompleteField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String placeText) onSelected;

  const LocationAutoCompleteField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GooglePlacesAutoCompleteTextFormField(
      googleAPIKey:
          ServicesUrls.mapApiKey, // 🔴 Replace with your actual API Key
      textEditingController: controller,
      debounceTime: 600,
      countries: ["QA"], // ✅ Set to Qatar
      fetchCoordinates: false, // ✅ Do not fetch lat/lng
      onSuggestionClicked: (prediction) {
        // ✅ Updated function to return only place text
        final placeText = prediction.description ?? "";
        controller.text = placeText;
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
        onSelected(placeText);
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        hintStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(fontSize: 14, color: AppColors.grey600),
        suffixIcon: const Icon(Icons.search, size: 20, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }
}
