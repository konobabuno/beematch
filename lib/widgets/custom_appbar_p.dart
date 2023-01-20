import 'package:beematch/config/app_router.dart';
import 'package:beematch/config/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBarP extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBarP({
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
          flex: 1,
          child: ElevatedButton(
            onPressed:() {
              Navigator.pushNamed(context, AppRoutes.initialRoute);
            }, 
            style: ElevatedButton.styleFrom(maximumSize: const Size(80,40), backgroundColor:AppTheme.yellow),
            child: Row(children:const [ Icon(Icons.arrow_back_rounded, color: AppTheme.primary), Text('Volver', style: TextStyle(color: AppTheme.primary),)]
            ),
          ),
        ),
        const Spacer( flex:2),
        ],
      )
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
