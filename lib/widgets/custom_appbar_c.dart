import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBarC extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBarC({
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
              Navigator.pushNamed(context, AppRoutes.matchesRoute);
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
            style: ElevatedButton.styleFrom(maximumSize: const Size(90,40), backgroundColor: AppTheme.purple),
            child: const Padding(
              padding: EdgeInsets.only(left: 2),
              child: Icon(Icons.question_mark_rounded, color: Colors.white)
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
