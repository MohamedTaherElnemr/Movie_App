import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.vulcan.withOpacity(0.7),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              'Favourite',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const ListTile(
            leading: Icon(
              Icons.feedback_rounded,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              'FeedBack',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ListTile(
            leading: const Icon(
              Icons.question_mark_rounded,
              color: Colors.white,
              size: 25,
            ),
            title: const Text(
              'About US',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColor.royalBlue,
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Close',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                    title: Text(
                      'About Us',
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'This app is developed By Mohamed Taher and the data is provided by TMDB',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          'assets/images/tmdb_logo.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
