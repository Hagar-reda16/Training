import 'package:flutter/material.dart';
import 'package:proj/product_card.dart';
import 'package:proj/products.dart';
import 'package:proj/product_data.dart';
import 'package:provider/provider.dart';
import 'package:proj/product_provider.dart';

class AllProductSection extends StatelessWidget {

   AllProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =Provider.of<ProductProvider>(context);
    final isLoading =productProvider.isLoading;
    final products = productProvider.getProducts;
    if(isLoading){
      return Center(
          child:CircularProgressIndicator(),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text("All products " , style: TextStyle(fontSize: 25),),
        const SizedBox(height: 5,),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,),
            shrinkWrap: true,
            itemCount: products.length,

            itemBuilder: (context,index){
              final product=products[index];
              return ProductCard(product: products[index]);
            }
        )
       
      ],
    );
  }
}


