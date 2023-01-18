import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed:() {
              Navigator.pushNamed(context, AppRoutes.yoRoute);
            }, 
            style: ElevatedButton.styleFrom(maximumSize: const Size(90,40), backgroundColor: const Color(0xFFFA80F4)),
            child: Row(children:const [ Icon(Icons.person, color: AppTheme.primary), Text('Yo', style: TextStyle(color: AppTheme.primary),)]
            ),
          ),
        ),
        const Spacer( flex:1 ),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed:() {
              Navigator.pushNamed(context, AppRoutes.matchesRoute);
            }, 
            style: ElevatedButton.styleFrom(maximumSize: const Size(110,40), backgroundColor: const Color(0xFFFFED46)),
            child: const Text('Matches', style: TextStyle(color: AppTheme.primary),)
            ),
        ),
        ],
      )
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
