import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/cubit/app_cubit.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

Widget searchTextField(context, controller) => Container(
      height: 45,
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        controller: controller,
        showCursor: true,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xff302360),
          focusColor: AppColor.violet,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(18)),
        ),
        onChanged: (value) {
          BlocProvider.of<AppCubit>(context).searchMovies(controller.text);
        },
      ),
    );
