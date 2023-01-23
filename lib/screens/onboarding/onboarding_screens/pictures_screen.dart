import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/blocs.dart';
import '../widgets/widgets.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;
  const Pictures({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading){
          return const Center(
                child: CircularProgressIndicator(),
          );
        }
        if (state is OnboardingLoaded){
          var images = state.user.imageUrls;
          var imageCount = images.length;

          return Scaffold(
            backgroundColor: AppTheme.green,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 30),
              child: Align(
                child: Column(
                  children: [
                    TextHead(
                        tabController: tabController,
                        color: AppTheme.primary,
                        colortext: AppTheme.green,
                        height: 150,
                        width: 350,
                        text:
                            'Agrega al menos dos fotos para mostrarlas a los demás.'),

                    Container(
                            padding: const EdgeInsets.only(top: 10),
                            height: MediaQuery.of(context).size.height / 2,
                            child: GridView.builder(gridDelegate: 
                            const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index){
                              return (imageCount > index) 
                                ? CustomImageContainer(imageUrl: images[index], tabController: tabController)
                                : CustomImageContainer(tabController: tabController);
                              })
                            ),

                        Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomButton(
                                tabController: tabController,
                                color: AppTheme.primary,
                                colortext: AppTheme.yellow,
                                text: 'Iniciar')))
                      ]
                    ),
              )
            )
          );
        } else{
          return const Text('Algo salió mal');
        }
      }
    );
  }
}
