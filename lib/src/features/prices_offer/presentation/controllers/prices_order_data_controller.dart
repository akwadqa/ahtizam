import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'prices_order_data_controller.g.dart';

enum PriceFilterType { all, lowestPrice, nearestToMe }

@riverpod
class PricesOfferDataController extends _$PricesOfferDataController {
  @override
  List<PriceOfferModel> build() {
    return [
      PriceOfferModel(
        driverName: "سالم محمد",
        driverImage:
            "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
        driverPhoneNumber: "+978988888",
        driverRating: "4.3",
        isDriverVerified: false,
        truckNumber: "123-ABC",
        location: "الدوحة, قطر",
        expectedTime: "30 دقيقة",
        price: "75 ر.ق",
        type: PriceFilterType.nearestToMe,
      ),
      PriceOfferModel(
        driverName: "أحمد علي",
        driverImage:
            "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
        driverPhoneNumber: "+978213188",
        driverRating: "4.8",
        isDriverVerified: true,
        truckNumber: "456-XYZ",
        location: "الوكرة, قطر",
        expectedTime: "45 دقيقة",
        price: "60 ر.ق",
        type: PriceFilterType.lowestPrice,
      ),
      PriceOfferModel(
        driverName: "أحمد علي",
        driverImage:
            "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
        driverPhoneNumber: "+978213188",
        driverRating: "4.8",
        isDriverVerified: true,
        truckNumber: "456-XYZ",
        location: "الوكرة, قطر",
        expectedTime: "45 دقيقة",
        price: "60 ر.ق",
        type: PriceFilterType.lowestPrice,
      ),
      PriceOfferModel(
        driverName: "أحمد علي",
        driverImage:
            "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
        driverPhoneNumber: "+978213188",
        driverRating: "4.8",
        isDriverVerified: true,
        truckNumber: "456-XYZ",
        location: "الوكرة, قطر",
        expectedTime: "45 دقيقة",
        price: "60 ر.ق",
        type: PriceFilterType.lowestPrice,
      ),
      PriceOfferModel(
        driverName: "أحمد علي",
        driverImage:
            "https://i.pinimg.com/736x/c6/5e/55/c65e55dcc904491dc5549bad8ecca3bb.jpg",
        driverPhoneNumber: "+978213188",
        driverRating: "4.8",
        isDriverVerified: true,
        truckNumber: "456-XYZ",
        location: "الوكرة, قطر",
        expectedTime: "45 دقيقة",
        price: "60 ر.ق",
        type: PriceFilterType.lowestPrice,
      ),
      // Add more mock data as needed
    ];
  }

  List<PriceOfferModel> getFilteredData(PriceFilterType filter) {
    if (filter == PriceFilterType.all) {
      return state;
    }
    return state.where((offer) => offer.type == filter).toList();
  }
}

class PriceOfferModel {
  final String driverName;
  final String driverImage;
  final String driverPhoneNumber;
  final String driverRating;
  final String truckNumber;
  final String location;
  final String expectedTime;
  final String price;
  final bool isDriverVerified;
  final PriceFilterType type;

  PriceOfferModel({
    required this.driverName,
    required this.driverImage,
    required this.driverPhoneNumber,
    required this.driverRating,
    required this.truckNumber,
    required this.location,
    required this.expectedTime,
    required this.price,
    required this.isDriverVerified,
    required this.type,
  });
}
