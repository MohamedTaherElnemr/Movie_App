import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/widgets/movie_details_appnar.dart';

Widget bigPoster(context, MovieModel model) => Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).primaryColor
              ])),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.baseImageUrl}${model.posterPath}',
            width: double.infinity,
          ),
        ),
        const Positioned(
            left: 10, right: 10, top: 30, child: MovieDetailsAppBar()),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ListTile(
              title: Text(
                '${model.title}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${model.releaseDate}',
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Text(
                '${model.voteAverage!.toString().substring(0, 3)} / 10',
                style: const TextStyle(
                    color: AppColor.violet,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
