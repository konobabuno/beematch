import 'package:beematch/config/theme.dart';
import 'package:beematch/models/models.dart';
import 'package:beematch/widgets/widgets.dart';
import 'package:flutter/material.dart';

class YoScreen extends StatelessWidget {
  const YoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    return Scaffold(
      appBar: const CustomAppBarP(),
      body: Container(
        alignment: Alignment.center,
        padding:const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.green,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(user.name, textAlign: TextAlign.center, style: const TextStyle(color: AppTheme.primary, fontSize: 40, fontWeight: FontWeight.bold) )),
            Column(
              children: [
                const TitleEdit(title: '¿Qué estudias?'),
                Text(user.study, style: const TextStyle(color: Colors.white, fontSize: 20),),
                const TitleEdit(title: 'Fotos'),
                            Pictures_List(user: user),
              ],
            )
          ],
        ),
      )
    );
  }

  SizedBox Pictures_List({required User user}) {
    return SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: user.imageUrls.length,
              itemBuilder:(context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Stack(
                    children: [
                      UserImage.small(
                        url: user.imageUrls[index],
                        height: 150,
                        width: 110,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}

class TitleEdit extends StatelessWidget {
  const TitleEdit({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 25, fontWeight: FontWeight.bold),),
          IconButton(onPressed:() {
          }, icon: const Icon(Icons.edit, color: AppTheme.green,))
        ],
      ),
    );
  }
}