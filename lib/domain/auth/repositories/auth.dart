import 'package:bloc_api_with_clean_architecture/data/auth/models/signin_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either> signUp(SignInReqParams params);
  Future<Either> signIn();
}