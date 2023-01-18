import 'package:beematch/blocs/swipe/swipe_bloc.dart';
import 'package:beematch/config/theme.dart';
import 'package:beematch/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: const CustomAppBar(),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if(state is SwipeLoading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is SwipeLoaded){
            return  Column(
              children: [
                Draggable(
                  feedback: UserCard(user: state.users[0]),
                  childWhenDragging: UserCard(user: state.users[1]),
                  onDragEnd: ((drag) {
                    if(drag.velocity.pixelsPerSecond.dx < 0){
                      context.read<SwipeBloc>()
                      ..add(SwipeLeft(user: state.users[0]));
                      print('Swipe Left');
                    }
                    if(drag.velocity.pixelsPerSecond.dx > 0){
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
                      onTap:() {
                        context.read<SwipeBloc>()
                        ..add(SwipeLeft(user: state.users[0]));
                        print('Swipe Left');
                      },
                      child: const ChoiceButton(
                        width: 130, 
                        height: 40, 
                        color: AppTheme.purple, 
                        text: 'Adios', 
                        colortext: Colors.white
                      ),
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
                        colortext: AppTheme.primary
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          else {return const Text('Error');}
        },
      )
    );
  }
}

