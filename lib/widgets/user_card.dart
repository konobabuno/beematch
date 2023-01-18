import 'package:beematch/models/models.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.imageUrls[0])
                ),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow( 
                    color: const Color.fromARGB(255, 0, 4, 28).withOpacity(0.25),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(3,3),
                  )
                ]
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(91, 2, 1, 31),
                  Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
              ),
            ),
            Positioned(
              bottom: 40,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  '${user.name}, ${user.age}', 
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: 
                    Colors.white, 
                    fontWeight: FontWeight.w600, 
                    fontSize: 25,
                    fontFamily: 'Poppins'
                    ),
                ),
                Text(
                  user.study, 
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: 
                    Colors.white, 
                    fontWeight: FontWeight.w600, 
                    fontSize: 17,
                    fontFamily: 'Poppins'
                    ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}

