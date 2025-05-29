// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyOrderModel _$MyOrderModelFromJson(Map<String, dynamic> json) {
  return _MyOrderModel.fromJson(json);
}

/// @nodoc
mixin _$MyOrderModel {
  String get driverName => throw _privateConstructorUsedError;
  String get driverImage => throw _privateConstructorUsedError;
  double get driverRating => throw _privateConstructorUsedError;
  String get otpNumber => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get truckNumber => throw _privateConstructorUsedError;
  String get fromAddress => throw _privateConstructorUsedError;
  String get toAddress => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng get userLocation => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng get destinationLocation => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;

  /// Serializes this MyOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyOrderModelCopyWith<MyOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrderModelCopyWith<$Res> {
  factory $MyOrderModelCopyWith(
          MyOrderModel value, $Res Function(MyOrderModel) then) =
      _$MyOrderModelCopyWithImpl<$Res, MyOrderModel>;
  @useResult
  $Res call(
      {String driverName,
      String driverImage,
      double driverRating,
      String otpNumber,
      String paymentMethod,
      String truckNumber,
      String fromAddress,
      String toAddress,
      double price,
      String date,
      String time,
      @LatLngConverter() LatLng userLocation,
      @LatLngConverter() LatLng destinationLocation,
      OrderStatus status});
}

/// @nodoc
class _$MyOrderModelCopyWithImpl<$Res, $Val extends MyOrderModel>
    implements $MyOrderModelCopyWith<$Res> {
  _$MyOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverName = null,
    Object? driverImage = null,
    Object? driverRating = null,
    Object? otpNumber = null,
    Object? paymentMethod = null,
    Object? truckNumber = null,
    Object? fromAddress = null,
    Object? toAddress = null,
    Object? price = null,
    Object? date = null,
    Object? time = null,
    Object? userLocation = null,
    Object? destinationLocation = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      driverImage: null == driverImage
          ? _value.driverImage
          : driverImage // ignore: cast_nullable_to_non_nullable
              as String,
      driverRating: null == driverRating
          ? _value.driverRating
          : driverRating // ignore: cast_nullable_to_non_nullable
              as double,
      otpNumber: null == otpNumber
          ? _value.otpNumber
          : otpNumber // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      truckNumber: null == truckNumber
          ? _value.truckNumber
          : truckNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      userLocation: null == userLocation
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      destinationLocation: null == destinationLocation
          ? _value.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyOrderModelImplCopyWith<$Res>
    implements $MyOrderModelCopyWith<$Res> {
  factory _$$MyOrderModelImplCopyWith(
          _$MyOrderModelImpl value, $Res Function(_$MyOrderModelImpl) then) =
      __$$MyOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String driverName,
      String driverImage,
      double driverRating,
      String otpNumber,
      String paymentMethod,
      String truckNumber,
      String fromAddress,
      String toAddress,
      double price,
      String date,
      String time,
      @LatLngConverter() LatLng userLocation,
      @LatLngConverter() LatLng destinationLocation,
      OrderStatus status});
}

/// @nodoc
class __$$MyOrderModelImplCopyWithImpl<$Res>
    extends _$MyOrderModelCopyWithImpl<$Res, _$MyOrderModelImpl>
    implements _$$MyOrderModelImplCopyWith<$Res> {
  __$$MyOrderModelImplCopyWithImpl(
      _$MyOrderModelImpl _value, $Res Function(_$MyOrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverName = null,
    Object? driverImage = null,
    Object? driverRating = null,
    Object? otpNumber = null,
    Object? paymentMethod = null,
    Object? truckNumber = null,
    Object? fromAddress = null,
    Object? toAddress = null,
    Object? price = null,
    Object? date = null,
    Object? time = null,
    Object? userLocation = null,
    Object? destinationLocation = null,
    Object? status = null,
  }) {
    return _then(_$MyOrderModelImpl(
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      driverImage: null == driverImage
          ? _value.driverImage
          : driverImage // ignore: cast_nullable_to_non_nullable
              as String,
      driverRating: null == driverRating
          ? _value.driverRating
          : driverRating // ignore: cast_nullable_to_non_nullable
              as double,
      otpNumber: null == otpNumber
          ? _value.otpNumber
          : otpNumber // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      truckNumber: null == truckNumber
          ? _value.truckNumber
          : truckNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      userLocation: null == userLocation
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      destinationLocation: null == destinationLocation
          ? _value.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyOrderModelImpl implements _MyOrderModel {
  const _$MyOrderModelImpl(
      {required this.driverName,
      required this.driverImage,
      required this.driverRating,
      required this.otpNumber,
      required this.paymentMethod,
      required this.truckNumber,
      required this.fromAddress,
      required this.toAddress,
      required this.price,
      required this.date,
      required this.time,
      @LatLngConverter() required this.userLocation,
      @LatLngConverter() required this.destinationLocation,
      required this.status});

  factory _$MyOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyOrderModelImplFromJson(json);

  @override
  final String driverName;
  @override
  final String driverImage;
  @override
  final double driverRating;
  @override
  final String otpNumber;
  @override
  final String paymentMethod;
  @override
  final String truckNumber;
  @override
  final String fromAddress;
  @override
  final String toAddress;
  @override
  final double price;
  @override
  final String date;
  @override
  final String time;
  @override
  @LatLngConverter()
  final LatLng userLocation;
  @override
  @LatLngConverter()
  final LatLng destinationLocation;
  @override
  final OrderStatus status;

  @override
  String toString() {
    return 'MyOrderModel(driverName: $driverName, driverImage: $driverImage, driverRating: $driverRating, otpNumber: $otpNumber, paymentMethod: $paymentMethod, truckNumber: $truckNumber, fromAddress: $fromAddress, toAddress: $toAddress, price: $price, date: $date, time: $time, userLocation: $userLocation, destinationLocation: $destinationLocation, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrderModelImpl &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverImage, driverImage) ||
                other.driverImage == driverImage) &&
            (identical(other.driverRating, driverRating) ||
                other.driverRating == driverRating) &&
            (identical(other.otpNumber, otpNumber) ||
                other.otpNumber == otpNumber) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.truckNumber, truckNumber) ||
                other.truckNumber == truckNumber) &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.userLocation, userLocation) ||
                other.userLocation == userLocation) &&
            (identical(other.destinationLocation, destinationLocation) ||
                other.destinationLocation == destinationLocation) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      driverName,
      driverImage,
      driverRating,
      otpNumber,
      paymentMethod,
      truckNumber,
      fromAddress,
      toAddress,
      price,
      date,
      time,
      userLocation,
      destinationLocation,
      status);

  /// Create a copy of MyOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrderModelImplCopyWith<_$MyOrderModelImpl> get copyWith =>
      __$$MyOrderModelImplCopyWithImpl<_$MyOrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyOrderModelImplToJson(
      this,
    );
  }
}

abstract class _MyOrderModel implements MyOrderModel {
  const factory _MyOrderModel(
      {required final String driverName,
      required final String driverImage,
      required final double driverRating,
      required final String otpNumber,
      required final String paymentMethod,
      required final String truckNumber,
      required final String fromAddress,
      required final String toAddress,
      required final double price,
      required final String date,
      required final String time,
      @LatLngConverter() required final LatLng userLocation,
      @LatLngConverter() required final LatLng destinationLocation,
      required final OrderStatus status}) = _$MyOrderModelImpl;

  factory _MyOrderModel.fromJson(Map<String, dynamic> json) =
      _$MyOrderModelImpl.fromJson;

  @override
  String get driverName;
  @override
  String get driverImage;
  @override
  double get driverRating;
  @override
  String get otpNumber;
  @override
  String get paymentMethod;
  @override
  String get truckNumber;
  @override
  String get fromAddress;
  @override
  String get toAddress;
  @override
  double get price;
  @override
  String get date;
  @override
  String get time;
  @override
  @LatLngConverter()
  LatLng get userLocation;
  @override
  @LatLngConverter()
  LatLng get destinationLocation;
  @override
  OrderStatus get status;

  /// Create a copy of MyOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyOrderModelImplCopyWith<_$MyOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
