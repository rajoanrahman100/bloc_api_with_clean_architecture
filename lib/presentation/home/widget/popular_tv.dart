import 'package:bloc_api_with_clean_architecture/common/bloc/generic_data_cubit.dart';
import 'package:bloc_api_with_clean_architecture/common/bloc/generic_data_state.dart';
import 'package:bloc_api_with_clean_architecture/common/widget/tv/tv_card.dart';
import 'package:bloc_api_with_clean_architecture/domain/movie/entities/movie.dart';
import 'package:bloc_api_with_clean_architecture/domain/tv/entities/tv.dart';
import 'package:bloc_api_with_clean_architecture/domain/tv/usecase/get_popular_tv.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/populartv_cubit.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/populartv_state.dart';
import 'package:bloc_api_with_clean_architecture/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataCubit()..getData<List<TVEntity>>(sl<GetPopularTVUseCase>()),
        child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is DataLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return TvCard(tvEntity: state.data[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: state.data.length),
              );
            }

            if (state is FailureDataLoaded) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ));
  }
}
