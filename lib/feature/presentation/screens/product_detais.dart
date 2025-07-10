import 'package:flutter/material.dart';

import 'package:proj/common_ui/products.dart';
import 'package:proj/feature/presentation/widgets/addButton.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/feature/presentation/manager/quantityBloc/quantity_bloc.dart';
import 'package:proj/service_locator.dart';



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
    final quantityBoc=getIt<QuantityBloc>();

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
                child: Text(product.description , style: TextStyle(fontSize:20 ,
                color: Colors.black38),)),
            const SizedBox(
              height:30,
            ),
            BlocBuilder<QuantityBloc,Map<int ,int>>
              (bloc: quantityBoc,
                builder: (context , quantityMap){
                  final product = products[index];
                   final productId=product.productId;
                   final quantity=quantityMap[productId] ??0;
                return AddButton(product: product);
              }
            )
             ,



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
}




