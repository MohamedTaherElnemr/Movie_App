import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.vulcan,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.vulcan,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  BlocProvider.of<AppCubit>(context).emitting();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            centerTitle: true,
            title: const Text(
              'Watch Trailers',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          body: ConditionalBuilder(
            condition: BlocProvider.of<AppCubit>(context).videos != null &&
                state is GetVideosSuccessState,
            builder: (context) {
              YoutubePlayerController controller = YoutubePlayerController(
                  initialVideoId:
                      BlocProvider.of<AppCubit>(context).videos![0].key!,
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ));
              return YoutubePlayerBuilder(
                player: YoutubePlayer(controller: controller),
                builder: (context, player) {
                  return Column(
                    children: [
                      player,
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0;
                                i <
                                    BlocProvider.of<AppCubit>(context)
                                        .videos!
                                        .length;
                                i++)
                              Container(
                                height: 100,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.load(
                                              BlocProvider.of<AppCubit>(context)
                                                  .videos![i]
                                                  .key!);

                                          controller.play();
                                        },
                                        child: CachedNetworkImage(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            imageUrl:
                                                YoutubePlayer.getThumbnail(
                                              videoId:
                                                  BlocProvider.of<AppCubit>(
                                                          context)
                                                      .videos![i]
                                                      .key!,
                                            )),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${BlocProvider.of<AppCubit>(context).videos![i].name}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ))
                    ],
                  );
                },
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
