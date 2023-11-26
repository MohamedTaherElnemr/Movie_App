import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/screens/movie_details_screen.dart';

Widget movieCardBuilder(context, index, List<MovieModel> movies) =>
    GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return MovieDetailScreen(model: movies[index]);
          },
        ));

        await BlocProvider.of<AppCubit>(context).getCastCrew(movies[index].id!);
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl:
                    '${ApiConstants.baseImageUrl}${movies[index].posterPath}',
                imageBuilder: (context, imageProvider) => Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${movies[index].title}',
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
