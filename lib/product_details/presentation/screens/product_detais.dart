import 'package:flutter/material.dart';
import 'package:proj/common_ui/products.dart';
import 'package:proj/common_ui/addButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/quantity_bloc/quantity_bloc.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';
import 'package:proj/data/models/product_model.dart';
import 'package:proj/data/services/product_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class ProductDetails extends StatefulWidget {
  final int productId;
  const ProductDetails({ super.key , required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  final PageController _pageController=PageController();
  int _currentIndex =0;
  bool _isFilled = false;
  @override
  Widget build(BuildContext context) {
    //final quantityBoc=getIt<QuantityBloc>();
    return FutureBuilder<ProductModel>(
        future: getIt<ProductService>().fetchProductDetails(widget.productId),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          }
          else if(snapshot.hasError){
            return Scaffold(
              body: Center(child: Text('Error ${snapshot.error}'),),
            );
          }
          final product= snapshot.data!;
          return Scaffold(
            body: Column(
              children: [
            SizedBox(
              height: 346,
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: product.images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        product.images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 16,
                    right: 167,
                    child: SizedBox(
                      width: 40,
                      height: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          product.images.length,
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
                  Positioned(
                      top:54,
                      left:24,
                      child:IconButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, icon: Icon(Icons.close , size: 20,color: Color(0xFF2F3036),))
                  )
                  ],
                ),

          ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.title ,style: TextStyle(
                            fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              letterSpacing: 0.5,
                              height: 1.0,
                              color: Color(0xFF1F2024)
                          ),),
                          IconButton(onPressed: (){
                            setState(() {
                              _isFilled=! _isFilled;
                            });
                            },
                              icon: Icon(
                                _isFilled?Icons.favorite:Icons.favorite_outline ,
                                size: 20,
                                color: Color(0xFF0019FF),
                              ),
                          ),
                        ],

                      ),
                     SizedBox(height: 8,),
                      Text('€ ${product.price}' ,
                           style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: 0,
                                height: 0.8,
                                color: Color(0xFF1F2024)
                    ),),
                      SizedBox(height: 24,),
                      Text(product.description , style: TextStyle(
                        fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: 0.1,
                          height: 1.4,
                          color: Color(0xFF71727A)
                      ),
                      ),
                      const SizedBox(height: 100,),
                      AddButton(product: product)
                    ],
                  ),
                )
                ]
          )
          );
        }
        );












// appBar: AppBar(
    //   backgroundColor: Colors.black,
    //   leading: IconButton(
    //       onPressed: (){
    //         Navigator.of(context).pop();
    //       },
    //       icon: Positioned(
    //           top: 54,
    //           left:24,
    //           child: const Icon(Icons.close , size: 20,))),
    // ),
    // body: Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SizedBox(
    //       height: 346,
    //       width: double.infinity,
    //       child: PageView.builder(
    //           controller: _pageController,
    //           itemCount: product.images.length,
    //           onPageChanged: (index){
    //             setState(() {
    //               _currentIndex=index;
    //             });
    //           },
    //           itemBuilder: (context,index){
    //             return Image.network(product.images[index]);
    //           }),
    //     ),
    //     const SizedBox(height: 8),
    //     Center(
    //       child: SmoothPageIndicator(
    //         controller: _pageController,
    //         count: product.images.length,
    //         effect: ExpandingDotsEffect(
    //           dotHeight: 8,
    //           dotWidth: 40,
    //           activeDotColor: Color(0xFF0019FF),
    //           dotColor: Color(0xFF1F2024),
    //         ),
    //       ),
    //     ),
    //     ////////////bottom sectionnnnnnnnnnn
    //     SizedBox(height: 40,),
    //     Padding(padding: EdgeInsets.all(24),
    //     child:Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             SizedBox(
    //                 width:800,
    //                 height: 22,
    //                 child: Text(product.title ,
    //                 style: TextStyle(
    //                   fontFamily: 'Inter',
    //                   fontWeight: FontWeight.w800,
    //                   fontSize: 18,
    //                   letterSpacing: 0.5,
    //                   height: 1.0,
    //                   color: Color(0xFF1F2024)
    //                 ),)),
    //             //Spacer(flex:1),
    //             IconButton(onPressed: (){
    //               setState(() {
    //                 _isFilled=! _isFilled;
    //               });
    //             },
    //                 icon: Icon(
    //                  _isFilled?Icons.favorite:Icons.favorite_outline ,
    //                   size: 20,
    //                 color: Color(0xFF0019FF),
    //                 )
    //
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //           height: 8,
    //         ),
    //         SizedBox(
    //           height: 22,
    //           width: 57,
    //           child: Text('€ ${product.price}',
    //           style: TextStyle(
    //             fontFamily: 'Inter',
    //             fontWeight: FontWeight.w400,
    //             fontSize: 16,
    //             letterSpacing: 0,
    //             height: 0.8,
    //             color: Color(0xFF1F2024)
    //           ),),
    //         ),
    //         SizedBox(height: 24,),
    //         SizedBox(
    //           width: double.infinity,
    //           height: 80,
    //           child:Text(product.description ,
    //           maxLines: 6,
    //             style: TextStyle(
    //                 fontFamily: 'Inter',
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: 12,
    //                 letterSpacing: 0.1,
    //                 height: 1.4,
    //               color: Color(0xFF71727A)
    //
    //             ),),
    //         ),
    //         /////////sizeee
    //         SizedBox(height: 40,),
    //         SizedBox(
    //           height: 15,
    //           width: 25,
    //           child: Text("Category" ,
    //             style: TextStyle(
    //                 fontFamily: 'Inter',
    //                 fontWeight: FontWeight.w700,
    //                 fontSize: 12,
    //                 letterSpacing: 0,
    //                 height: 0.12,
    //                 color: Color(0xFF1F2024)),
    //         ),),
    //         SizedBox(height: 8,),
    //         SizedBox(
    //           height: 15,
    //           width: 25,
    //           child: Text(product.categoryName ,
    //             style: TextStyle(
    //                 fontFamily: 'Inter',
    //                 fontWeight: FontWeight.w700,
    //                 fontSize: 12,
    //                 letterSpacing: 0,
    //                 height: 0.12,
    //                 color: Color(0xFF1F2024)),
    //           ),),
    //
    //
    //
    //
    //
    //       ],
    //     ),
    //
    //     ),
    //   ],
    // ),








    // return Scaffold(
    //   appBar: AppBar(title: Text(product.name),
    //   centerTitle: true,),
    //   body: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         buildImg(product),
    //         SizedBox(height: 16,),
    //         Text(product.name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
    //         const SizedBox(height: 12,),
    //         Text(product.price, style: TextStyle(fontWeight:FontWeight.bold , fontSize: 24),),
    //         const SizedBox(height:12),
    //         description(product),
    //         const SizedBox(
    //           height:30,
    //         ),
    //         BlocBuilder<QuantityBloc,Map<int ,int>>
    //           (bloc: quantityBoc,
    //             builder: (context , quantityMap){
    //               final product = products[index];
    //                final productId=product.productId;
    //                final quantity=quantityMap[productId] ??0;
    //             return AddButton(product: product);
    //           }
    //         )
    //          ,
    //
    //
    //
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget description(Product product) {
    return Padding(
              padding: EdgeInsets.only(left:4 , right: 4),
              child: Text(product.description , style: TextStyle(fontSize:20 ,
              color: Colors.black38),));
  }

  Widget buildImg(Product product) {
    return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(product.imgproduct , fit: BoxFit.cover , height: 200,),
          );
  }
}




