import 'package:bloc_api_with_clean_architecture/core/constants/api_url.dart';
import 'package:bloc_api_with_clean_architecture/core/network/dio_client.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/models/signin_req_params.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/models/signup_req_params.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthApiService {
  Future<Either> signUp(SignupReqParams params);

  Future<Either> signIn(SignInReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signIn(SignInReqParams params) async{
    // TODO: implement signUIn
    try {
      var response = await sl<DioClient>().post(ApiUrl.signin, data: params.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left("Exception ${e.response!.data["message"]}");
    }
  }

  @override
  Future<Either> signUp(SignupReqParams params) async {
    // TODO: implement signUp
    try {
      var response = await sl<DioClient>().post(ApiUrl.signup, data: params.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left("Exception ${e.response!.data["message"]}");
    }
  }
}
