import 'package:flutter/material.dart';
class FeaturedSection extends StatefulWidget {
  const FeaturedSection({super.key});

  @override
  State<FeaturedSection> createState() => _FeaturedSectionState();
}

class _FeaturedSectionState extends State<FeaturedSection> {
  final PageController _pageController=PageController();
  int _currentIndex =0;
  final List<String> images=[
    'assets/pics/Property 1=Pic 1.png',
    'assets/pics/Property 1=Pic 2.png',
    'assets/pics/Property 1=Pic 3.png',
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
     return SizedBox(
       width: screenWidth,
       height: 214,
       child: Stack(
         alignment: Alignment.bottomCenter,
         children: [
           PageView.builder(
             controller: _pageController,
             itemCount: images.length,
             onPageChanged: (index) {
               setState(() {
                 _currentIndex = index;
               });
             },
             itemBuilder: (context, index) {
               return Image.asset(
                 images[index],
                 fit: BoxFit.cover,
                 width: screenWidth,
                 height: double.infinity,
               );
             },
           ),
           Positioned(
             bottom: 13,
             right: 167,
             child: SizedBox(
               width: 40,
               height: 8,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: List.generate(
                   images.length,
                       (index) => AnimatedContainer(
                     duration: const Duration(milliseconds: 300),
                     width: 8,
                     height: 8,
                     decoration: BoxDecoration(
                       color: _currentIndex == index
                           ? const Color(0xFF0019FF).withOpacity(1.0)
                           : const Color(0xFF1F2024).withOpacity(0.5),
                       borderRadius: BorderRadius.circular(24),
                     ),
                   ),
                 ),
               ),
             ),
           ),
         ],
       ),
     );
    // Container(
    //   width: double.infinity,
    //   height: 214,
    //   // padding: const EdgeInsets.symmetric(
    //   //   horizontal: 167,
    //   //   vertical: 13
    //   // ),
    //   //clipBehavior: Clip.hardEdge,
    //   child: Image.asset("assets/pics/upperImg.jpg" , fit: BoxFit.cover,
    //   // height: double.infinity,
    //   width: double.infinity,
    //   ),
    // );
  }

/*
*
* Column(
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
    );*/
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
