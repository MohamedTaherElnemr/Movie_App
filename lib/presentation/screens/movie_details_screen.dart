import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/screens/videos_screen.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/widgets/cast_builder.dart';
import 'package:movies_app/presentation/widgets/custome_button.dart';
import 'package:movies_app/presentation/widgets/movie_deatils_big_poster.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.model});
  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.vulcan,
          body: SingleChildScrollView(
            child: Column(
              children: [
                bigPoster(context, model),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '${model.overview}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cast',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ),
                ConditionalBuilder(
                  condition: BlocProvider.of<AppCubit>(context).cast != null &&
                      state is GetCastSuccessState,
                  builder: (context) => castBuilder(context),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customButton(context, 'Watch Trailers', () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return VideosScreen();
                    },
                  ));

                  await BlocProvider.of<AppCubit>(context).getVideos(model.id);
                }),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
