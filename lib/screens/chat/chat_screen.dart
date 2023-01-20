import 'package:beematch/config/theme.dart';
import 'package:beematch/models/user_match_model.dart';
import 'package:beematch/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
   
  const ChatScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserMatch;
    final name = args.matchedUser.name;
    return Scaffold(
      appBar: const CustomAppBarC(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.topCenter,
            child: Text(
              name, 
              style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)
            )
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration( 
                color: const Color.fromARGB(255, 59, 61, 68),
                borderRadius: BorderRadius.circular(10)
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.02,
              child: SingleChildScrollView(
                child: 
                args.chat != null 
                  ? SizedBox(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.6,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: args.chat![0].messages.length,
                        itemBuilder:(context, index) {
                          return ListTile(
                            title: 
                            args.chat![0].messages[index].senderId==1
                            ? 
          
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppTheme.pink
                                ),
                                child: Text(args.chat![0].messages[index].message, style: const TextStyle(fontFamily: 'Poppins'),))
                            ):
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppTheme.green
                                ),
                                child: Text(args.chat![0].messages[index].message, style: const TextStyle(fontFamily: 'Poppins'),))
                            )
                          );
                        
                        },
          
                      ),
                    ) ,
                  )        
                  : SizedBox()
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Escribe hola:)',
                      ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color: Color.fromARGB(255, 59, 61, 68), shape: BoxShape.circle),
                  margin: const EdgeInsets.only(left: 10),
                  child: IconButton(
                  icon: const Icon(Icons.send),
                  color: AppTheme.yellow,
                  style: const ButtonStyle(backgroundColor:  MaterialStatePropertyAll<Color>(Color.fromARGB(255, 59, 61, 68)) ),
                  onPressed:() {}, 
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
