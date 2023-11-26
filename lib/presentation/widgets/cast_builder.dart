import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';

Widget castBuilder(context) => Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                height: 200,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          '${ApiConstants.baseImageUrl}${BlocProvider.of<AppCubit>(context).cast![index].profilePath}',
                      imageBuilder: (context, imageProvider) => Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${BlocProvider.of<AppCubit>(context).cast![index].originalName}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${BlocProvider.of<AppCubit>(context).cast![index].character}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: 10),
    );
