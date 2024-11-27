import 'package:bloc_api_with_clean_architecture/common/bloc/generic_data_state.dart';
import 'package:bloc_api_with_clean_architecture/core/usecase/usecase.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T> (UseCase useCase,{dynamic params}) async {
    var data = await useCase.call(params: params);

    data.fold((error) {
      emit(FailureDataLoaded(message: error));
    }, (data) {
      emit(DataLoaded<T>(data: data));
    });
  }
}