import 'package:bloc_api_with_clean_architecture/data/auth/models/signin_req_params.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/models/signup_req_params.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/source/auth/auth_api_service.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/usecase/signup_usecase.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signIn(SignInReqParams? params) async{
    // TODO: implement signIn
    return await sl<AuthApiServiceImpl>().signIn(params!);
  }

  @override
  Future<Either> signUp(SignupReqParams? params) async{
    return await sl<AuthApiServiceImpl>().signUp(params!);
  }

}