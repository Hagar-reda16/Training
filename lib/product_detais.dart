import 'package:flutter/material.dart';
import 'package:proj/product_provider.dart';
import 'package:proj/products.dart';
import 'package:provider/provider.dart';

class ProductDetais extends StatelessWidget {
  const ProductDetais({required this.product,super.key});
 final  Product product;
  @override
  Widget build(BuildContext context) {
    // final productProvider =Provider.of<ProductProvider>(context);
    // final isLoading =productProvider.isLoading;
    // final products = productProvider.getProducts;
    // if(isLoading){
    //   return Center(
    //     child:CircularProgressIndicator(),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(title: Text(product.name),
      centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(product.imgproduct , fit: BoxFit.cover , height: 200,),
          ),
          SizedBox(height: 15,),
          Text(product.name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
          const SizedBox(height: 10,),
          Text(product.price, style: TextStyle(fontWeight:FontWeight.bold , fontSize: 22),),
          const SizedBox(height:10),
          Padding(
              padding: EdgeInsets.only(left:5 , right: 5),
              child: Text(product.description , style: TextStyle(fontSize:20 ),)),
          const SizedBox(
            height:30,
          ),
           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${product.name} added to cart ")),
                  );
                },
                child: Text("ADD TO CART " , style: TextStyle(color:Colors.white , fontSize: 20),),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 backgroundColor: Color(0xFFB39DDB)
              ),
            ),
          )


        ],
      ),
    );
  }
}
