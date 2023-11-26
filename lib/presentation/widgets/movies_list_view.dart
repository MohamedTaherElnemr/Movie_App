import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie_result_model/movie_model.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/widgets/movie_card_builder.dart';

Widget moviesListView(context, List<MovieModel> movies) => ListView.separated(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => movieCardBuilder(context, index, movies),
    separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
    itemCount: BlocProvider.of<AppCubit>(context).popularMovies!.length);
