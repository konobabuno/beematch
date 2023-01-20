import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBarM extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBarM({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(
          flex: 4,
          child: ElevatedButton(
            onPressed:() {
              Navigator.pushNamed(context, AppRoutes.initialRoute);
            }, 
            style: ElevatedButton.styleFrom(maximumSize: const Size(80,40), backgroundColor:AppTheme.yellow),
            child: Row(children:const [ Icon(Icons.arrow_back_rounded, color: AppTheme.primary), Text('Volver', style: TextStyle(color: AppTheme.primary),)]
            ),
          ),
        ),
        const Spacer( flex:5 ),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed:() {
              Navigator.pushNamed(context, AppRoutes.yoRoute);
            }, 
            style: ElevatedButton.styleFrom(maximumSize: const Size(90,40), backgroundColor: const Color(0xFFFA80F4)),
            child: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Row(children:const [ Icon(Icons.person, color: AppTheme.primary), Text('Yo', style: TextStyle(color: AppTheme.primary),)]
              ),
            ),
          ),
        ),
        ],
      )
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
