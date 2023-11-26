import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';

import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/widgets/search_body_builder.dart';
import 'package:movies_app/presentation/widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                },
                icon: const Icon(Icons.arrow_back_ios)),
            centerTitle: true,
            title: searchTextField(context, controller),
          ),
          body: Column(
            children: [
              if (state is SearchMoviesLoadingState)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (state is SearchMoviesSuccessState &&
                  BlocProvider.of<AppCubit>(context).searchResult != null)
                searchBodyBuilder(),
              if (state is SearchMoviesFailedState)
                const Center(
                  child: Text(
                    'Movies Found 0 ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
