import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final TabController tabController;
  const CustomImageContainer({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: IconButton(
              iconSize: 40,
              icon: const Icon(Icons.add_circle, color: AppTheme.green,), onPressed: () {},
            ),
          )
        ),
      ),
    );
  }
}