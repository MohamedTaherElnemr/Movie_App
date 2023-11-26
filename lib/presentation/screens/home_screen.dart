import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/screens/search_screen.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

import 'package:movies_app/presentation/widgets/home_screen_body_builder.dart';
import 'package:movies_app/presentation/widgets/navigation_drwoer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          drawer: const CustomNavigationDrawer(),
          backgroundColor: AppColor.vulcan,
          appBar: AppBar(
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: SvgPicture.asset(
            //     'assets/images/menu.svg',
            //     width: 70,
            //     height: 50,
            //   ),
            // ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SearchScreen();
                      },
                    ));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
            elevation: 0,
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 150,
            ),
            backgroundColor: AppColor.vulcan,
          ),
          body: ConditionalBuilder(
            condition: BlocProvider.of<AppCubit>(context).topRatedMovies !=
                    null &&
                BlocProvider.of<AppCubit>(context).popularMovies != null &&
                BlocProvider.of<AppCubit>(context).nowplayingMovies != null &&
                BlocProvider.of<AppCubit>(context).upcomingMovies != null,
            builder: (context) => HomeScreenBodyBuilder(),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

// Widget bodyBUilder(context, state) => Column(
//       children: [
//         customCarouselSlider(context),
//         Seprator(),
//         SizedBox(
//           height: 20,
//         ),
//       ],
//     );
