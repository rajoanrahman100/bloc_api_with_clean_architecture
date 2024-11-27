import 'package:bloc_api_with_clean_architecture/common/widget/tv/tv_card.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/populartv_cubit.dart';
import 'package:bloc_api_with_clean_architecture/presentation/home/block/populartv_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PopularTVCubit()..getPopularTV(),
        child: BlocBuilder<PopularTVCubit, PopularTVState>(
          builder: (context, state) {
            if (state is PopularTVLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PopularTVLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return TvCard(tvEntity: state.tv[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: state.tv.length),
              );
            }

            if (state is PopularTVError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ));
  }
}
