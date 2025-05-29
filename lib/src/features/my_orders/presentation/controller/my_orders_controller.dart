// controllers/my_orders_controller.dart
import 'package:ahtizam/src/features/my_orders/domain/model/my_order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_orders_controller.g.dart';

@riverpod
class MyOrdersController extends _$MyOrdersController {
  @override
  List<MyOrderModel> build() {
    return [
      MyOrderModel(
        driverName: "محمد",
        driverImage: "https://i.pravatar.cc/150?img=3",
        driverRating: 4.5,
        otpNumber: "2525",
        paymentMethod: "Apple Pay",
        truckNumber: "KE232",
        fromAddress: "شارع ألف",
        toAddress: "شارع باء",
        price: 50,
        date: "20 أكتوبر 23",
        time: "10:00 صباحا",
        userLocation: LatLng(40.659569, -73.933783),
        destinationLocation: LatLng(40.659555, -73.933766),
        status: OrderStatus.accepted,
      ),
      MyOrderModel(
        driverName: "محمد",
        driverImage: "https://i.pravatar.cc/150?img=3",
        driverRating: 4.5,
        otpNumber: "2525",
        paymentMethod: "Apple Pay",
        truckNumber: "KE232",
        fromAddress: "شارع ألف",
        toAddress: "شارع باء",
        price: 50,
        date: "20 أكتوبر 23",
        time: "10:00 صباحا",
        userLocation: LatLng(40.659569, -73.933783),
        destinationLocation: LatLng(40.659555, -73.933766),
        status: OrderStatus.pending,
      ),
      MyOrderModel(
        driverName: "محمد",
        driverImage: "https://i.pravatar.cc/150?img=3",
        driverRating: 4.5,
        otpNumber: "2525",
        paymentMethod: "Apple Pay",
        truckNumber: "KE232",
        fromAddress: "شارع ألف",
        toAddress: "شارع باء",
        price: 50,
        date: "20 أكتوبر 23",
        time: "10:00 صباحا",
        userLocation: LatLng(40.659569, -73.933783),
        destinationLocation: LatLng(40.659555, -73.933766),
        status: OrderStatus.rejected,
      ),
    ];
  }

  List<MyOrderModel> getFilteredOrders(OrderStatus? status) {
    if (status == OrderStatus.all) {
      return state;
    }
    return state.where((order) => order.status == status).toList();
  }
}
