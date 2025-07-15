
import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/rating/data/data_source/rating_remote_data_source.dart';
import 'package:ahtizam/src/features/rating/domain/rating_params.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'rating_repository.g.dart';

@Riverpod(keepAlive: true)
RatingRepository ratingRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return RatingRepository(RatingRemoteDataSource(networkService));
}

class RatingRepository {
  final RatingRemoteDataSource _remoteDataSource;

  RatingRepository(this._remoteDataSource);

  

  Future<ApiResponse> ratingDriver(RatingParams ratingParams) async {
    final response = await _remoteDataSource.ratingDriver(ratingParams);
    if(response.status==200){
    return  response;

    }
    throw AppException(response.message);

  }
  

 

}
