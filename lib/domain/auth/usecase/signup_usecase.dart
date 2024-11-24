import 'package:bloc_api_with_clean_architecture/core/usecase/usecase.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/models/signup_req_params.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase extends UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }
}
