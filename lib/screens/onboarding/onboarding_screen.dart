import 'package:flutter/material.dart';
import 'onboarding_screens/screens.dart';

class OnBoardingScreen extends StatelessWidget {
   
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const List<Tab> tabs = <Tab>[
    Tab(text:'Start'),
    Tab(text:'Email'),
    Tab(text:'Verification'),
    Tab(text:'Gender'),
    Tab(text:'Info'),
    Tab(text:'Study'),
    Tab(text:'Pictures'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length, 
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        return Scaffold(
          body: TabBarView(
            children: [
              Start(tabController: tabController),
              Email(tabController: tabController),
              Verification(tabController: tabController),
              Gender(tabController: tabController),
              Info(tabController: tabController),
              Study(tabController: tabController),
              Pictures(tabController: tabController),
            ],
          ),
        );
      }),
    );
  }
}

