import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:beematch/models/models.dart';
import 'package:beematch/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  
  const MatchesScreen({super.key});
  @override
  Widget build(BuildContext context){
    final inactiveMatches = UserMatch.matches.where((match) => match.userId == 1 && match.chat!.isEmpty).toList();
    final activeMatches = UserMatch.matches.where((match) => match.userId == 1 && match.chat!.isNotEmpty).toList();
    return Scaffold(
      appBar: const CustomAppBarM(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppTheme.purple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Text(
                  'Matches', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 23, 
                    fontWeight: FontWeight.w700,
                    ),
                ),
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: inactiveMatches.length,
                itemBuilder:(context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      children: [
                        UserImage.small(
                          url: inactiveMatches[index].matchedUser.imageUrls[0],
                          height: 150,
                          width: 110,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.5),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding:const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                            color: AppTheme.pink,
                            borderRadius: BorderRadius.circular(10)
                          ),
                            child: Text(
                              inactiveMatches[index].matchedUser.name,
                              style: const TextStyle(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppTheme.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Text(
                  'Chats', 
                  style: TextStyle(
                    color: AppTheme.primary, 
                    fontSize: 23, 
                    fontWeight: FontWeight.w700,
                    ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width / 1.15,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: activeMatches.length,
                itemBuilder:(context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.chatRoute, arguments: UserMatch (id: activeMatches[index].id, userId: activeMatches[index].userId, matchedUser: activeMatches[index].matchedUser, chat:activeMatches[index].chat));
                      },
                      child: Row(
                        children: [
                          UserImage.small(
                            height: 100,
                            width: 70,
                            url: activeMatches[index].matchedUser.imageUrls[0],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(activeMatches[index].matchedUser.name, 
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                      ),
                                ),
                                Text(activeMatches[index].chat![0].messages[0].message, 
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins'
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}