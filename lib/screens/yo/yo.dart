import 'package:beematch/blocs/blocs.dart';
import 'package:beematch/config/theme.dart';
import 'package:beematch/models/models.dart';
import 'package:beematch/repositories/repositories.dart';
import 'package:beematch/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YoScreen extends StatelessWidget {
  const YoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarP(),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProfileLoaded) {
                return Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppTheme.green,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(state.user.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppTheme.primary,
                                fontSize: 40,
                                fontWeight: FontWeight.bold))),
                    Column(
                      children: [
                        const TitleEdit(title: '¿Qué estudias?'),
                        Text(
                          state.user.study,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const TitleEdit(title: 'Fotos'),
                        picturesList(user: state.user),
                        TextButton(
                            onPressed: () {
                              RepositoryProvider.of<AuthRepository>(context)
                                  .signOut();
                            },
                            child: const Center(
                              child: Text('Log Out'),
                            ))
                      ],
                    )
                  ],
                );
              } else {
                return const Text('Algo salió mal, reinicia la app porfavor');
              }
            },
          ),
        ));
  }

  SizedBox picturesList({required User user}) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: user.imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: [
                UserImage.small(
                  url: user.imageUrls[index],
                  height: 150,
                  width: 110,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TitleEdit extends StatelessWidget {
  const TitleEdit({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: AppTheme.green,
              ))
        ],
      ),
    );
  }
}
