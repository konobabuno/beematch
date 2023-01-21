import 'package:beematch/cubits/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  final Color color;
  final Color colortext;

  const CustomButton({super.key, required this.tabController, required this.color, required this.colortext, required this.text,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        tabController.animateTo(tabController.index + 1);
        if(tabController.index == 2){
          context.read<SignupCubit>().signUpWithCredentials();
        }
      },
      style: ElevatedButton.styleFrom(
              backgroundColor: color
      ), 
      child: Text(text, style: TextStyle(color: colortext),),
    );
  }
}