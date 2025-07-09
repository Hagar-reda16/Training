import 'package:flutter/material.dart';
import 'package:proj/feature/presentation/manager/product_provider.dart';
import 'package:proj/common_ui/products.dart';
import 'package:provider/provider.dart';

class ProductDetais extends StatelessWidget {
  const ProductDetais({

    required this.products,
    required this.index,
    super.key});

 final List<Product> products;
 final int index;
  @override
  Widget build(BuildContext context) {

    final product=products[index];

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildImg(product),
            SizedBox(height: 16,),
            Text(product.name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 12,),
            Text(product.price, style: TextStyle(fontWeight:FontWeight.bold , fontSize: 24),),
            const SizedBox(height:12),
            Padding(
                padding: EdgeInsets.only(left:4 , right: 4),
                child: Text(product.description , style: TextStyle(fontSize:20 ),)),
            const SizedBox(
              height:30,
            ),
             buildElevatedButton(context, product)


          ],
        ),
      ),
    );
  }

  ClipRRect buildImg(Product product) {
    return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(product.imgproduct , fit: BoxFit.cover , height: 200,),
          );
  }





  SizedBox buildElevatedButton(BuildContext context, Product product) {
    return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 16,right: 16),
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
            ),
          );
  }
}
