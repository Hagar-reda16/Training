import 'package:flutter/material.dart';
import 'package:proj/products.dart';
class Part3 extends StatelessWidget {
final List <Product> products=[
  Product(imgproduct: "D:/proj/assets/pics/concealer.webp" ,name: "Concealer" ,price: "500 LE"),
  Product(imgproduct: "D:/proj/assets/pics/lipglossproduct.webp" ,name: "Lipgloss" ,price: "400 LE"),
  Product(imgproduct: "D:/proj/assets/pics/mascara1.webp" ,name: "Mascara" ,price: "300 LE"),
  Product(imgproduct: "D:/proj/assets/pics/nailpolish.jpg" ,name: "Nail Polish" ,price: "150 LE"),
];
   Part3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text("All products " , style: TextStyle(fontSize: 25),),
        const SizedBox(height: 5,),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,),
            shrinkWrap: true,
            itemCount: products.length,

            itemBuilder: (context,index){
              final product=products[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ClipRRect(
                          child: Image.asset(product.imgproduct ,
                          fit: BoxFit.cover,),
                           borderRadius: BorderRadius.circular(12),
                      ),
                  ),
                  Padding(padding: EdgeInsets.all(7) ,
                  child: Text(product.name),),
                  Padding(padding: EdgeInsets.all(7) ,
                    child: Text(product.price),),
                ],
              ),
              );
            }
        )
       
      ],
    );
  }
}


// Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.start,
//  children: [
//    //1
//    Expanded(child:
//    Container(
//      // width: 120,
//      height: 140,
//      margin: EdgeInsets.all(4),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(7),
//      ),
//      child:
//      Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Image.asset("D:/proj/assets/pics/lipglossproduct.webp",
//            width: 60,height: 60, fit: BoxFit.cover,),
//          SizedBox(height :5),
//          Text("Lip gloss") ,
//          Text("10 Dollars")
//        ],
//      ),
//    ),),
//    //2
//    SizedBox(width: 10,),
//    Expanded(child:
//    Container(
//      // width: 120,
//      height: 140,
//      margin: EdgeInsets.all(4),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(7),
//      ),
//      child:
//      Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Image.asset("D:/proj/assets/pics/lipglossproduct.webp",
//          width: 60,height: 60, fit: BoxFit.cover,),
//          SizedBox(height :5),
//          Text("Lip gloss") ,
//          Text("10 Dollars")
//        ],
//      ),
//    ),),
//
//  ],
// )
