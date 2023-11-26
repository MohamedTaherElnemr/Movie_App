import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/screens/movie_details_screen.dart';

class searchBodyBuilder extends StatelessWidget {
  const searchBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MovieDetailScreen(
                            model: BlocProvider.of<AppCubit>(context)
                                .searchResult![index]);
                      },
                    ));

                    BlocProvider.of<AppCubit>(context).getCastCrew(
                        BlocProvider.of<AppCubit>(context)
                            .searchResult![index]
                            .id!);
                  },
                  child: Row(
                    children: [
                      if (BlocProvider.of<AppCubit>(context)
                              .searchResult![index]
                              .posterPath !=
                          null)
                        ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ApiConstants.baseImageUrl}${BlocProvider.of<AppCubit>(context).searchResult![index].posterPath}',
                            imageBuilder: (context, imageProvider) => Container(
                              margin: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width / 2,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      Expanded(
                        child: Text(
                          '${BlocProvider.of<AppCubit>(context).searchResult![index].title}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount:
                BlocProvider.of<AppCubit>(context).searchResult!.length));
  }
}
