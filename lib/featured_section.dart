import 'package:flutter/material.dart';
class Part1 extends StatelessWidget {
  const Part1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Featured :" , style: TextStyle( fontSize: 25),) ,
         const SizedBox (
          height: 5,
        ),
        Stack(
          children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child:Image.asset("D:/proj/assets/pics/makeup.jpg" , fit: BoxFit.cover, ),),
            Positioned(
              bottom: 0,
              left:0,
              right:0,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5) ,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding:EdgeInsets.all(7) ,
                  child: Text("This site is for Make-up and Skin care products",
                    style: TextStyle(color: Colors.white ,fontSize: 20,),),
                  )
              ) ,

          ],
        )
        
      ],
    );
  }
}
