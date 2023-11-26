import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/screens/movie_details_screen.dart';

Widget customCarouselSlider(context) => CarouselSlider(
      items: BlocProvider.of<AppCubit>(context)
          .popularMovies!
          .map(
            (e) => ClipRRect(
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.baseImageUrl}${e.posterPath}',
                imageBuilder: (context, imageProvider) => GestureDetector(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MovieDetailScreen(
                        model: e,
                      );
                    }));

                    await BlocProvider.of<AppCubit>(context).getCastCrew(e.id!);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        // enlargeStrategy: CenterPageEnlargeStrategy.zoom,

        height: 300,
        enableInfiniteScroll: true,
        initialPage: 0,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.easeInOut,
        scrollDirection: Axis.horizontal,
        // viewportFraction: 1,
        pageSnapping: true,
        onPageChanged: (index, reason) {},
      ),
    );
