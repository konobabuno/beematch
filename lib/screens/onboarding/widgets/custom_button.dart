import 'package:beematch/blocs/blocs.dart';
import 'package:beematch/cubits/signup/signup_cubit.dart';
import 'package:beematch/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  final Color color;
  final Color colortext;
  final void function;

  const CustomButton({
    super.key,
    required this.tabController,
    required this.color,
    required this.colortext,
    required this.text,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    final read = context.read<SignupCubit>();
    return ElevatedButton(
      onPressed: () async {
        if (tabController.index <= 7) {
          tabController.animateTo(tabController.index + 1);
        } else {
          Navigator.pushNamed(context, '/');
        }

        if (tabController.index == 2) {
          await context.read<SignupCubit>().signUpWithCredentials();

          User user = User(
              id: read.state.user?.uid,
              name: '',
              age: 0,
              gender: '',
              imageUrls: [],
              question: '',
              find: '',
              study: '',
              location: '');

          // ignore: use_build_context_synchronously
          context.read<OnboardingBloc>().add(
                StartOnboarding(user: user),
              );
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(
        text,
        style: TextStyle(color: colortext),
      ),
    );
  }
}
