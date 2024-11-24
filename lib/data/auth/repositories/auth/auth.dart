import 'package:bloc_api_with_clean_architecture/data/auth/models/signin_req_params.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/models/signup_req_params.dart';
import 'package:bloc_api_with_clean_architecture/data/auth/source/auth/auth_api_service.dart';
import 'package:bloc_api_with_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInReqParams? params) async {
    // TODO: implement signIn
    var data = await sl<AuthApiServiceImpl>().signIn(params!);

    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data["user"]["token"]);
      return Right(data);
    });
  }

  @override
  Future<Either> signUp(SignupReqParams? params) async {
    var data = await sl<AuthApiServiceImpl>().signUp(params!);

    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data["user"]["token"]);
      return Right(data);
    });
  }

  @override
  Future<bool> isLoggedIn() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token  = sharedPreferences.getString('token');
    if(token != null){
      return true;
    }else{
      return false;
    }

  }
}
