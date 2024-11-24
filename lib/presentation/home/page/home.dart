import 'package:bloc_api_with_clean_architecture/common/widget/appbar/app_bar.dart';
import 'package:bloc_api_with_clean_architecture/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left:10),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
    );
  }
}
