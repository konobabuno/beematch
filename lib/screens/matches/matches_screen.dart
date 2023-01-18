import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  
  const MatchesScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Matches')),
      backgroundColor: const Color(0xFF02FFA4),
    );
  }
}