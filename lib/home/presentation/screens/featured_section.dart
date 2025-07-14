import 'package:flutter/material.dart';
class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Featured :" , style: TextStyle( fontSize: 24),) ,
         const SizedBox (
          height: 4,
        ),
        Stack(
          children: [
            backGroundImg(),
            textContainer() ,

          ],
        )
        
      ],
    );
  }






  Widget textContainer() {
    return Positioned(
            bottom: 0,
            left:0,
            right:0,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5) ,
                  borderRadius: BorderRadius.circular(12)
                ),
                padding:EdgeInsets.all(8) ,
                child: Text("This site is for Make-up and Skin care products",
                  style: TextStyle(color: Colors.white ,fontSize: 20,),),
                )
            );
  }

  Widget backGroundImg() {
    return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child:Image.asset("D:/proj/assets/pics/makeup.jpg" , fit: BoxFit.cover, ),);
  }
}
