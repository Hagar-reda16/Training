import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [

           CircleAvatar(
             radius: 140,
             child: CircleAvatar(
               backgroundImage: AssetImage("assets/pics/cat.jpg"),
               radius: 132,
             ),
           ),
           const SizedBox(
             height: 12,
           ),
           const Text("Hagar Reda "),
           const SizedBox(height: 20,),
           Row(
             children: [
               const Text("Points",style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold), ),
               Spacer(flex: 2,),
               const Text("5,400,00 Points" , style: TextStyle(color: Colors.grey , fontSize: 16),)
             ],
           )
         ],
      ),
    );
  }
}
