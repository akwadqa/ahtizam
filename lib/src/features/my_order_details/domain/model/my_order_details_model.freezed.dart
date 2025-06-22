// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_order_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyOrderDetailsModel _$MyOrderDetailsModelFromJson(Map<String, dynamic> json) {
  return _MyOrderDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$MyOrderDetailsModel {
  @JsonKey(name: 'quick_order_id')
  String get quickOrderId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_details')
  DriverDetails get driverDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'passenger_details')
  PassengerDetails get passengerDetails => throw _privateConstructorUsedError;
  @JsonKey(name: "passenger_location")
  OrderLocationModel get passengerLocation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "destination_location")
  OrderLocationModel get destinationLocation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "map_image")
  String? get mapImage => throw _privateConstructorUsedError;
  @JsonKey(name: "service_type")
  String get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_method")
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_code")
  String? get couponCode => throw _privateConstructorUsedError;
  @JsonKey(name: "fare_details")
  FareDetails get fareDetails => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_date")
  DateTime get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_time")
  String get creationTime => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time")
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "end_time")
  String get endTime => throw _privateConstructorUsedError;

  /// Serializes this MyOrderDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyOrderDetailsModelCopyWith<MyOrderDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrderDetailsModelCopyWith<$Res> {
  factory $MyOrderDetailsModelCopyWith(
          MyOrderDetailsModel value, $Res Function(MyOrderDetailsModel) then) =
      _$MyOrderDetailsModelCopyWithImpl<$Res, MyOrderDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'quick_order_id') String quickOrderId,
      String status,
      @JsonKey(name: 'driver_details') DriverDetails driverDetails,
      @JsonKey(name: 'passenger_details') PassengerDetails passengerDetails,
      @JsonKey(name: "passenger_location") OrderLocationModel passengerLocation,
      @JsonKey(name: "destination_location")
      OrderLocationModel destinationLocation,
      @JsonKey(name: "map_image") String? mapImage,
      @JsonKey(name: "service_type") String serviceType,
      @JsonKey(name: "payment_method") String paymentMethod,
      @JsonKey(name: "coupon_code") String? couponCode,
      @JsonKey(name: "fare_details") FareDetails fareDetails,
      @JsonKey(name: "creation_date") DateTime creationDate,
      @JsonKey(name: "creation_time") String creationTime,
      @JsonKey(name: "start_time") String startTime,
      @JsonKey(name: "end_time") String endTime});

  $DriverDetailsCopyWith<$Res> get driverDetails;
  $PassengerDetailsCopyWith<$Res> get passengerDetails;
  $OrderLocationModelCopyWith<$Res> get passengerLocation;
  $OrderLocationModelCopyWith<$Res> get destinationLocation;
  $FareDetailsCopyWith<$Res> get fareDetails;
}

/// @nodoc
class _$MyOrderDetailsModelCopyWithImpl<$Res, $Val extends MyOrderDetailsModel>
    implements $MyOrderDetailsModelCopyWith<$Res> {
  _$MyOrderDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quickOrderId = null,
    Object? status = null,
    Object? driverDetails = null,
    Object? passengerDetails = null,
    Object? passengerLocation = null,
    Object? destinationLocation = null,
    Object? mapImage = freezed,
    Object? serviceType = null,
    Object? paymentMethod = null,
    Object? couponCode = freezed,
    Object? fareDetails = null,
    Object? creationDate = null,
    Object? creationTime = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      quickOrderId: null == quickOrderId
          ? _value.quickOrderId
          : quickOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      driverDetails: null == driverDetails
          ? _value.driverDetails
          : driverDetails // ignore: cast_nullable_to_non_nullable
              as DriverDetails,
      passengerDetails: null == passengerDetails
          ? _value.passengerDetails
          : passengerDetails // ignore: cast_nullable_to_non_nullable
              as PassengerDetails,
      passengerLocation: null == passengerLocation
          ? _value.passengerLocation
          : passengerLocation // ignore: cast_nullable_to_non_nullable
              as OrderLocationModel,
      destinationLocation: null == destinationLocation
          ? _value.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as OrderLocationModel,
      mapImage: freezed == mapImage
          ? _value.mapImage
          : mapImage // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: freezed == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fareDetails: null == fareDetails
          ? _value.fareDetails
          : fareDetails // ignore: cast_nullable_to_non_nullable
              as FareDetails,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverDetailsCopyWith<$Res> get driverDetails {
    return $DriverDetailsCopyWith<$Res>(_value.driverDetails, (value) {
      return _then(_value.copyWith(driverDetails: value) as $Val);
    });
  }

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PassengerDetailsCopyWith<$Res> get passengerDetails {
    return $PassengerDetailsCopyWith<$Res>(_value.passengerDetails, (value) {
      return _then(_value.copyWith(passengerDetails: value) as $Val);
    });
  }

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderLocationModelCopyWith<$Res> get passengerLocation {
    return $OrderLocationModelCopyWith<$Res>(_value.passengerLocation, (value) {
      return _then(_value.copyWith(passengerLocation: value) as $Val);
    });
  }

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderLocationModelCopyWith<$Res> get destinationLocation {
    return $OrderLocationModelCopyWith<$Res>(_value.destinationLocation,
        (value) {
      return _then(_value.copyWith(destinationLocation: value) as $Val);
    });
  }

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FareDetailsCopyWith<$Res> get fareDetails {
    return $FareDetailsCopyWith<$Res>(_value.fareDetails, (value) {
      return _then(_value.copyWith(fareDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyOrderDetailsModelImplCopyWith<$Res>
    implements $MyOrderDetailsModelCopyWith<$Res> {
  factory _$$MyOrderDetailsModelImplCopyWith(_$MyOrderDetailsModelImpl value,
          $Res Function(_$MyOrderDetailsModelImpl) then) =
      __$$MyOrderDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quick_order_id') String quickOrderId,
      String status,
      @JsonKey(name: 'driver_details') DriverDetails driverDetails,
      @JsonKey(name: 'passenger_details') PassengerDetails passengerDetails,
      @JsonKey(name: "passenger_location") OrderLocationModel passengerLocation,
      @JsonKey(name: "destination_location")
      OrderLocationModel destinationLocation,
      @JsonKey(name: "map_image") String? mapImage,
      @JsonKey(name: "service_type") String serviceType,
      @JsonKey(name: "payment_method") String paymentMethod,
      @JsonKey(name: "coupon_code") String? couponCode,
      @JsonKey(name: "fare_details") FareDetails fareDetails,
      @JsonKey(name: "creation_date") DateTime creationDate,
      @JsonKey(name: "creation_time") String creationTime,
      @JsonKey(name: "start_time") String startTime,
      @JsonKey(name: "end_time") String endTime});

  @override
  $DriverDetailsCopyWith<$Res> get driverDetails;
  @override
  $PassengerDetailsCopyWith<$Res> get passengerDetails;
  @override
  $OrderLocationModelCopyWith<$Res> get passengerLocation;
  @override
  $OrderLocationModelCopyWith<$Res> get destinationLocation;
  @override
  $FareDetailsCopyWith<$Res> get fareDetails;
}

/// @nodoc
class __$$MyOrderDetailsModelImplCopyWithImpl<$Res>
    extends _$MyOrderDetailsModelCopyWithImpl<$Res, _$MyOrderDetailsModelImpl>
    implements _$$MyOrderDetailsModelImplCopyWith<$Res> {
  __$$MyOrderDetailsModelImplCopyWithImpl(_$MyOrderDetailsModelImpl _value,
      $Res Function(_$MyOrderDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quickOrderId = null,
    Object? status = null,
    Object? driverDetails = null,
    Object? passengerDetails = null,
    Object? passengerLocation = null,
    Object? destinationLocation = null,
    Object? mapImage = freezed,
    Object? serviceType = null,
    Object? paymentMethod = null,
    Object? couponCode = freezed,
    Object? fareDetails = null,
    Object? creationDate = null,
    Object? creationTime = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$MyOrderDetailsModelImpl(
      quickOrderId: null == quickOrderId
          ? _value.quickOrderId
          : quickOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      driverDetails: null == driverDetails
          ? _value.driverDetails
          : driverDetails // ignore: cast_nullable_to_non_nullable
              as DriverDetails,
      passengerDetails: null == passengerDetails
          ? _value.passengerDetails
          : passengerDetails // ignore: cast_nullable_to_non_nullable
              as PassengerDetails,
      passengerLocation: null == passengerLocation
          ? _value.passengerLocation
          : passengerLocation // ignore: cast_nullable_to_non_nullable
              as OrderLocationModel,
      destinationLocation: null == destinationLocation
          ? _value.destinationLocation
          : destinationLocation // ignore: cast_nullable_to_non_nullable
              as OrderLocationModel,
      mapImage: freezed == mapImage
          ? _value.mapImage
          : mapImage // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: freezed == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fareDetails: null == fareDetails
          ? _value.fareDetails
          : fareDetails // ignore: cast_nullable_to_non_nullable
              as FareDetails,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyOrderDetailsModelImpl implements _MyOrderDetailsModel {
  const _$MyOrderDetailsModelImpl(
      {@JsonKey(name: 'quick_order_id') required this.quickOrderId,
      required this.status,
      @JsonKey(name: 'driver_details') required this.driverDetails,
      @JsonKey(name: 'passenger_details') required this.passengerDetails,
      @JsonKey(name: "passenger_location") required this.passengerLocation,
      @JsonKey(name: "destination_location") required this.destinationLocation,
      @JsonKey(name: "map_image") this.mapImage,
      @JsonKey(name: "service_type") required this.serviceType,
      @JsonKey(name: "payment_method") required this.paymentMethod,
      @JsonKey(name: "coupon_code") this.couponCode,
      @JsonKey(name: "fare_details") required this.fareDetails,
      @JsonKey(name: "creation_date") required this.creationDate,
      @JsonKey(name: "creation_time") required this.creationTime,
      @JsonKey(name: "start_time") required this.startTime,
      @JsonKey(name: "end_time") required this.endTime});

  factory _$MyOrderDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyOrderDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: 'quick_order_id')
  final String quickOrderId;
  @override
  final String status;
  @override
  @JsonKey(name: 'driver_details')
  final DriverDetails driverDetails;
  @override
  @JsonKey(name: 'passenger_details')
  final PassengerDetails passengerDetails;
  @override
  @JsonKey(name: "passenger_location")
  final OrderLocationModel passengerLocation;
  @override
  @JsonKey(name: "destination_location")
  final OrderLocationModel destinationLocation;
  @override
  @JsonKey(name: "map_image")
  final String? mapImage;
  @override
  @JsonKey(name: "service_type")
  final String serviceType;
  @override
  @JsonKey(name: "payment_method")
  final String paymentMethod;
  @override
  @JsonKey(name: "coupon_code")
  final String? couponCode;
  @override
  @JsonKey(name: "fare_details")
  final FareDetails fareDetails;
  @override
  @JsonKey(name: "creation_date")
  final DateTime creationDate;
  @override
  @JsonKey(name: "creation_time")
  final String creationTime;
  @override
  @JsonKey(name: "start_time")
  final String startTime;
  @override
  @JsonKey(name: "end_time")
  final String endTime;

  @override
  String toString() {
    return 'MyOrderDetailsModel(quickOrderId: $quickOrderId, status: $status, driverDetails: $driverDetails, passengerDetails: $passengerDetails, passengerLocation: $passengerLocation, destinationLocation: $destinationLocation, mapImage: $mapImage, serviceType: $serviceType, paymentMethod: $paymentMethod, couponCode: $couponCode, fareDetails: $fareDetails, creationDate: $creationDate, creationTime: $creationTime, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrderDetailsModelImpl &&
            (identical(other.quickOrderId, quickOrderId) ||
                other.quickOrderId == quickOrderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.driverDetails, driverDetails) ||
                other.driverDetails == driverDetails) &&
            (identical(other.passengerDetails, passengerDetails) ||
                other.passengerDetails == passengerDetails) &&
            (identical(other.passengerLocation, passengerLocation) ||
                other.passengerLocation == passengerLocation) &&
            (identical(other.destinationLocation, destinationLocation) ||
                other.destinationLocation == destinationLocation) &&
            (identical(other.mapImage, mapImage) ||
                other.mapImage == mapImage) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.fareDetails, fareDetails) ||
                other.fareDetails == fareDetails) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quickOrderId,
      status,
      driverDetails,
      passengerDetails,
      passengerLocation,
      destinationLocation,
      mapImage,
      serviceType,
      paymentMethod,
      couponCode,
      fareDetails,
      creationDate,
      creationTime,
      startTime,
      endTime);

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrderDetailsModelImplCopyWith<_$MyOrderDetailsModelImpl> get copyWith =>
      __$$MyOrderDetailsModelImplCopyWithImpl<_$MyOrderDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyOrderDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _MyOrderDetailsModel implements MyOrderDetailsModel {
  const factory _MyOrderDetailsModel(
          {@JsonKey(name: 'quick_order_id') required final String quickOrderId,
          required final String status,
          @JsonKey(name: 'driver_details')
          required final DriverDetails driverDetails,
          @JsonKey(name: 'passenger_details')
          required final PassengerDetails passengerDetails,
          @JsonKey(name: "passenger_location")
          required final OrderLocationModel passengerLocation,
          @JsonKey(name: "destination_location")
          required final OrderLocationModel destinationLocation,
          @JsonKey(name: "map_image") final String? mapImage,
          @JsonKey(name: "service_type") required final String serviceType,
          @JsonKey(name: "payment_method") required final String paymentMethod,
          @JsonKey(name: "coupon_code") final String? couponCode,
          @JsonKey(name: "fare_details") required final FareDetails fareDetails,
          @JsonKey(name: "creation_date") required final DateTime creationDate,
          @JsonKey(name: "creation_time") required final String creationTime,
          @JsonKey(name: "start_time") required final String startTime,
          @JsonKey(name: "end_time") required final String endTime}) =
      _$MyOrderDetailsModelImpl;

  factory _MyOrderDetailsModel.fromJson(Map<String, dynamic> json) =
      _$MyOrderDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: 'quick_order_id')
  String get quickOrderId;
  @override
  String get status;
  @override
  @JsonKey(name: 'driver_details')
  DriverDetails get driverDetails;
  @override
  @JsonKey(name: 'passenger_details')
  PassengerDetails get passengerDetails;
  @override
  @JsonKey(name: "passenger_location")
  OrderLocationModel get passengerLocation;
  @override
  @JsonKey(name: "destination_location")
  OrderLocationModel get destinationLocation;
  @override
  @JsonKey(name: "map_image")
  String? get mapImage;
  @override
  @JsonKey(name: "service_type")
  String get serviceType;
  @override
  @JsonKey(name: "payment_method")
  String get paymentMethod;
  @override
  @JsonKey(name: "coupon_code")
  String? get couponCode;
  @override
  @JsonKey(name: "fare_details")
  FareDetails get fareDetails;
  @override
  @JsonKey(name: "creation_date")
  DateTime get creationDate;
  @override
  @JsonKey(name: "creation_time")
  String get creationTime;
  @override
  @JsonKey(name: "start_time")
  String get startTime;
  @override
  @JsonKey(name: "end_time")
  String get endTime;

  /// Create a copy of MyOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyOrderDetailsModelImplCopyWith<_$MyOrderDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
