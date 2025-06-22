import 'package:freezed_annotation/freezed_annotation.dart';
part 'fare_details_model.freezed.dart';
part 'fare_details_model.g.dart';

@freezed
class FareDetails with _$FareDetails {
  const factory FareDetails({
    @JsonKey(name: "base_fare") required double baseFare,
    @JsonKey(name: "discount_amount")  int? discountAmount,
    @JsonKey(name: "tax_fee") required double taxFee,
    @JsonKey(name: "final_fare") required double finalFare,
  }) = _FareDetails;

  factory FareDetails.fromJson(Map<String, dynamic> json) =>
      _$FareDetailsFromJson(json);
}
