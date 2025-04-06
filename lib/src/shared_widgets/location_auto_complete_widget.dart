import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/src/features/home/presentation/controller/location_search_controller.dart'; // Import the controller

class LocationAutoCompleteField extends ConsumerWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String placeText) onSelected;
  final String fieldId; // Unique ID for this text field

  const LocationAutoCompleteField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onSelected,
    required this.fieldId, // Pass a unique identifier for each field
  }) : super(key: key);

  Future<void> _handleSearch(WidgetRef ref, String input) async {
    if (input.isEmpty) {
      ref
          .read(locationSearchControllerProvider.notifier)
          .clearPredictions(fieldId);
      return;
    }

    final places = GoogleMapsPlaces(
      apiKey: ServicesUrls.mapApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    final result = await places.autocomplete(
      input,
      language: 'en',
    );

    if (result.status == "OK") {
      ref
          .read(locationSearchControllerProvider.notifier)
          .updatePredictions(fieldId, result.predictions);
    }
  }

  Future<void> _getPlaceDetails(String placeId, context) async {
    final places = GoogleMapsPlaces(
      apiKey: ServicesUrls.mapApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    final detail = await places.getDetailsByPlaceId(placeId);
    final lat = detail.result.geometry?.location.lat;
    final lng = detail.result.geometry?.location.lng;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected Place Details - Lat: $lat, Lng: $lng')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // Dismiss keyboard
      },
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            onChanged: (input) {
              _handleSearch(ref, input); // Trigger search on text change
            },
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.white,
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 12, color: AppColors.grey600),
              suffixIcon:
                  const Icon(Icons.search, size: 20, color: Colors.black),
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
            validator: (value) {
              if (value!.isEmpty) return 'enter_location'.tr();
              return null;
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final predictions =
                  ref.watch(locationSearchControllerProvider)[fieldId] ?? [];

              if (predictions.isNotEmpty) {
                return Container(
                    padding: EdgeInsets.zero,
                    height: 200,
                    color: Colors.white,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,

                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      shrinkWrap:
                          true, // Shrink the ListView to fit its content
                      physics:
                          const ClampingScrollPhysics(), // Prevents further scrolling when content is fully displayed
                      itemCount: predictions.length,
                      itemBuilder: (context, index) {
                        final prediction = predictions[index];
                        return ListTile(
                          title: Text(prediction.description ?? ''),
                          onTap: () async {
                            onSelected(prediction.description ?? "");
                            await _getPlaceDetails(
                                prediction.placeId!, context);
                            FocusScope.of(context)
                                .requestFocus(FocusNode()); // Dismiss keyboard
                            // Clear the list of predictions after selection
                            ref
                                .read(locationSearchControllerProvider.notifier)
                                .clearPredictions(fieldId);
                          },
                        );
                      },
                    ));
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
