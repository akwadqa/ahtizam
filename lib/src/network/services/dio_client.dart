import 'package:ahtizam/src/network/services/dio_remote_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/Api/services_urls.dart';
import 'network_service.dart';

part 'dio_client.g.dart';


@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  const timeout = Duration(seconds: 120);

  final dio = Dio(BaseOptions(
    baseUrl: ServicesUrls.prodBaseUrl,
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
  ));
  // dio.interceptors.add(RemoteInterceptor(ref));
dio.interceptors.addAll([
  RemoteInterceptor(ref), // Your custom logic for ***REMOVED***, language, error mapping
  PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ),
]);
  // dio.interceptors.addAll([
  //   InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       if (***REMOVED*** != null) {
  //         options.headers['Authorization'] = "***REMOVED*** $***REMOVED***";
  //       }
  //       // options.queryParameters['sl'] = language;
  //       options.headers['Accept-Language'] = language;
  //       handler.next(options);
  //     },
  //     onError: (error, handler) {
  //       handler.reject(DioExceptionHandler.handle(error));
  //     },
  //   ),
  //   LogInterceptor(requestBody: true, responseBody: true),
  // ]);

  return dio;
}

/// NetworkService injection
@Riverpod(keepAlive: true)
NetworkService networkService(Ref ref, [Dio? dio]) =>
    DioNetworkService(dio ?? ref.watch(dioProvider));
