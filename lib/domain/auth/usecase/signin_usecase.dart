import 'package:bloc_api_with_clean_architecture/core/usecase/usecase.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/models/signin_req_params.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase extends UseCase<Either,SignInReqParams>{
  @override
  Future<Either> call({SignInReqParams? params}) async{
    return await sl<AuthRepository>().signIn(params!);
  }

}