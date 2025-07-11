import 'package:flutter/material.dart';
import 'package:proj/home/presentation/widgets/product_card.dart';
import 'package:proj/common_ui/products.dart';
import 'package:proj/common_ui/product_data.dart';
import 'package:provider/provider.dart';


class AllProductSection extends StatelessWidget {

   AllProductSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text("All products :" , style: TextStyle(fontSize: 25),),
        const SizedBox(height: 4,),
        GridView.builder(

            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.65,
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,),
            shrinkWrap: true,
            itemCount: products.length,

            itemBuilder: (context,index){
              final product=products[index];
              return ProductCard(products: products, index: index);
            }
        )
       
      ],
    );
  }
}


