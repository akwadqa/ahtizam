import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/Api/services_urls.dart';
import '../../localization/current_language.dart';
import '../exception/dio_exceptions.dart';
import 'network_service.dart';

part 'dio_client.g.dart';


@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  const timeout = Duration(seconds: 120);
  final language = ref.watch(currentLanguageProvider);
  final ***REMOVED*** = ref.watch(userDataProvider);

  final dio = Dio(BaseOptions(
    baseUrl: ServicesUrls.baseUrl,
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
  ));

  dio.interceptors.addAll([
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (***REMOVED*** != null) {
          options.headers['Authorization'] = ***REMOVED***;
        }
        // options.queryParameters['sl'] = language;
        options.headers['Accept-Language'] = language;
        handler.next(options);
      },
      onError: (error, handler) {
        handler.reject(DioExceptionHandler.handle(error));
      },
    ),
    LogInterceptor(requestBody: true, responseBody: true),
  ]);

  return dio;
}

/// NetworkService injection
@Riverpod(keepAlive: true)
NetworkService networkService(Ref ref, [Dio? dio]) =>
    DioNetworkService(dio ?? ref.watch(dioProvider));
