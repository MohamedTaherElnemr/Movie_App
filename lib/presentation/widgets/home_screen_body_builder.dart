import 'package:flutter/material.dart';
import 'package:movies_app/presentation/widgets/custome_carousel_slider.dart';
import 'package:movies_app/presentation/widgets/custome_tab_bar.dart';
import 'package:movies_app/presentation/widgets/seprator.dart';

class HomeScreenBodyBuilder extends StatelessWidget {
  const HomeScreenBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customCarouselSlider(context),
          const Seprator(),
          const SizedBox(
            height: 20,
          ),
          CustomeTabBar(),
        ],
      ),
    );
  }
}
