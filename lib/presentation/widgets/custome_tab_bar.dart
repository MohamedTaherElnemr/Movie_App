import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';

import 'package:movies_app/presentation/themes/app_colors.dart';

import 'package:movies_app/presentation/widgets/movies_list_view.dart';

class CustomeTabBar extends StatefulWidget {
  const CustomeTabBar({super.key});

  @override
  State<CustomeTabBar> createState() => _CustomeTabBarState();
}

class _CustomeTabBarState extends State<CustomeTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: TabBar(
                  indicatorColor: AppColor.royalBlue,
                  isScrollable: true,
                  controller: tabController,
                  labelColor: AppColor.violet,
                  unselectedLabelColor: Colors.white,
                  tabs: const [
                    Tab(
                      text: 'Popular',
                    ),
                    Tab(
                      text: 'Now Playing',
                    ),
                    Tab(
                      text: 'Upcoming',
                    ),
                    Tab(
                      text: 'Top Rated',
                    ),
                  ]),
            ),
            Container(
              width: double.infinity,
              height: 400,
              child: TabBarView(controller: tabController, children: [
                moviesListView(
                    context, BlocProvider.of<AppCubit>(context).popularMovies!),
                moviesListView(context,
                    BlocProvider.of<AppCubit>(context).nowplayingMovies!),
                moviesListView(context,
                    BlocProvider.of<AppCubit>(context).upcomingMovies!),
                moviesListView(context,
                    BlocProvider.of<AppCubit>(context).topRatedMovies!),
              ]),
            )
          ],
        ));
  }
}
