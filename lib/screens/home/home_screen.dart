import 'package:beematch/blocs/swipe/swipe_bloc.dart';
import 'package:beematch/config/theme.dart';
import 'package:beematch/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: BlocBuilder<SwipeBloc, SwipeState>(
          builder: (context, state) {
            print(state);
            if (state is SwipeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SwipeLoaded) {
              var userCount = state.users.length;
              return Column(
                children: [
                  Draggable(
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: (userCount > 0)
                        ? UserCard(user: state.users[1])
                        : Container(),
                    onDragEnd: ((drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        context.read<SwipeBloc>()
                          ..add(SwipeLeft(user: state.users[0]));
                        print('Swipe Left');
                      }
                      if (drag.velocity.pixelsPerSecond.dx > 0) {
                        context.read<SwipeBloc>()
                          ..add(SwipeRight(user: state.users[0]));
                        print('Swipe Right');
                      }
                    }),
                    child: UserCard(user: state.users[0]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeft(user: state.users[0]));
                          print('Swipe Left');
                        },
                        child: const ChoiceButton(
                            width: 130,
                            height: 40,
                            color: AppTheme.purple,
                            text: 'Adios',
                            colortext: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeRight(user: state.users[0]));
                          print('Swipe Right');
                        },
                        child: const ChoiceButton(
                            width: 130,
                            height: 40,
                            color: AppTheme.green,
                            text: '¡Hola!',
                            colortext: AppTheme.primary),
                      ),
                    ],
                  ),
                ],
              );
            }
            if (state is SwipeError) {
              return Center(
                  child: Text('No hay mas usuarios',
                      style: Theme.of(context).textTheme.headline4));
            } else {
              return const Text('Error');
            }
          },
        ));
  }
}
