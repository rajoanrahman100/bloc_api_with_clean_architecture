import 'package:bloc_api_with_clean_architecture/data/auth/models/signin_req_params.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(SignInReqParams params) async{
    // TODO: implement signUp

  }

}