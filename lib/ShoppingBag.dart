import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_bag/generated/assets.dart';

class Product {
  final int id;
  final String image;
  final String name;
  final String color;
  final String size;
  final double price;
  int quantity;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}
List<Product> products = [
  Product(id: 1, image: 'assets/images/image1.png', name: 'Pullover', color: 'Black', size: 'L', price: 51),
  Product(id: 2, image: 'assets/images/image2.png', name: 'T-Shirt', color: 'Gray', size: 'L', price: 30),
  Product(id: 2, image: 'assets/images/image3.png', name: 'Sport Dress', color: 'Black', size: 'M', price: 43),
];
double getTotalPrice() {
  double total = 0.0;
  for (final product in products) {
    total += (product.price*product.quantity);
  }
  return total;
}

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({super.key});

  @override
  State<ShoppingBag> createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        appBar: AppBar(
          backgroundColor: Color(0xffF9F9F9),
          elevation: 0,
          actions: const [
            Icon(CupertinoIcons.search,size: 24,color: Color(0xff222222),),
            SizedBox(width: 16)
          ],
        ),
        body:
        OrientationBuilder(
    builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: (
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 24),
                          child: Text(
                              "My Bag",
                              style: TextStyle(
                                fontSize: 34,
                                fontFamily: Assets.fontsMetropolisRegular,
                                fontWeight: FontWeight.w700,
                              )
                          ),
                        ),

                        Container(
                          height: 400,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,

                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return Column(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.all(0),
                                      color: Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(

                                          height: 114,
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: [
                                              Image.asset(product.image , width: 104,height: 114,fit: BoxFit.fill,),
                                              SizedBox(width: 12,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 11,),
                                                  Text(product.name , style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff222222),
                                                    fontFamily: Assets.fontsMetropolisRegular,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                                  const SizedBox(height: 4,),
                                                  Row(
                                                    children: [
                                                      const Text("Color: " , style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff9B9B9B),
                                                        fontFamily: Assets.fontsMetropolisRegular,
                                                        fontWeight: FontWeight.w400,
                                                      )),
                                                      Text(product.color , style: const TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff222222),
                                                        fontFamily: Assets.fontsMetropolisRegular,
                                                        fontWeight: FontWeight.w400,
                                                      )),
                                                      const SizedBox(width: 13,),
                                                      const Text("Size: " , style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff9B9B9B),
                                                        fontFamily: Assets.fontsMetropolisRegular,
                                                        fontWeight: FontWeight.w400,
                                                      )),
                                                      Text(product.size , style: const TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff222222),
                                                        fontFamily: Assets.fontsMetropolisRegular,
                                                        fontWeight: FontWeight.w400,
                                                      )),
                                                    ],
                                                  ),
                                                  Spacer(),Row(
                                                    children: [
                                                      InkWell(
                                                       onTap: (){setState(() {
                                                         if (product.quantity > 0) {
                                                           product.quantity--;
                                                         }
                                                       });},
                                                        child: Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors.grey.shade300, //New
                                                                  blurRadius: 25.0,
                                                                  offset: Offset(0, 10))
                                                            ],
                                                            shape: BoxShape.circle,
                                                            color: Colors.white,

                                                          ),
                                                          child: Icon(Icons.remove,size: 24,color: Colors.grey,),
                                                        ),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                        child: Text(product.quantity.toString() , style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Color(0xff222222),
                                                          fontFamily: Assets.fontsMetropolisRegular,
                                                          fontWeight: FontWeight.w500,
                                                        )),
                                                      ),
                                                      InkWell(
                                                        onTap: (){setState(() {

                                                            product.quantity++;

                                                        });},
                                                        child: Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors.grey.shade300, //New
                                                                  blurRadius: 25.0,
                                                                  offset: Offset(0, 10))
                                                            ],
                                                            shape: BoxShape.circle,
                                                            color: Colors.white,

                                                          ),
                                                          child: Icon(Icons.add,size: 24,color: Colors.grey,),
                                                        ),
                                                      ),
                                                      //Spacer(),

                                                    ],
                                                  ),
                                                  const SizedBox(height: 12,)

                                                ],
                                              ),
                                              const Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 12, top: 10 , right: 20),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    const Icon(CupertinoIcons.ellipsis_vertical,size: 24,color: Color(0xff9B9B9B),),
                                                    const Spacer(),
                                                    Text("${product.price.toStringAsFixed(0)}\$" , style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff222222),
                                                      fontFamily: Assets.fontsMetropolisRegular,
                                                      fontWeight: FontWeight.w500,
                                                    )),


                                                  ],
                                                ),
                                              ),

                                            ],
                                          )
                                      ),
                                    ),
                                    const SizedBox(height: 24,)
                                  ],
                                );
                              }

                          ),
                        ),
                        const SizedBox(height: 200,)


                      ],
                    )

                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffF9F9F9),
                    child: Column(
                      children: [
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            const Text("Total Amount", style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff9B9B9B),
                              fontFamily: Assets.fontsMetropolisRegular,
                              fontWeight: FontWeight.w500,
                            )),
                            const Spacer(),
                            Text("${getTotalPrice().toStringAsFixed(0)}\$",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff222222),
                                  fontFamily: Assets.fontsMetropolisRegular,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        InkWell(
                          onTap: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Congratulations! Your order has been checked out.'),
                              ),
                            );
                          },
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xffDB3022),
                            ),
                            child: const Text("CHECK OUT", style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffffffff),
                              fontFamily: Assets.fontsMetropolisRegular,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ),
                        const SizedBox(height: 20,),

                      ],
                    ),
                  ))
            ],

          ),
        );
    }
      else{

        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: (
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 24),
                          child: Text(
                              "My Bag",
                              style: TextStyle(
                                fontSize: 34,
                                fontFamily: Assets.fontsMetropolisRegular,
                                fontWeight: FontWeight.w700,
                              )
                          ),
                        ),

                        Container(
                          height: 400,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,

                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return Column(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.all(0),
                                      color: Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(

                                          height: 114,
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: [
                                              Image.asset(product.image , width: 104,height: 114,fit: BoxFit.fill,),
                                              SizedBox(width: 12,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 11,),
                                                  Text(product.name , style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff222222),
                                                    fontFamily: Assets.fontsMetropolisRegular,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                                  const SizedBox(height: 4,),
                                                  Row(
                                                    children: [
                                                      const Text("Color: " , style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff9B9B9B),
                                                        fontFamily: Assets.fontsMetropolisRegular,
                                                        fontWeight: FontWeight.w400,
                                                      )),
                                                      Text(product.color , style: const TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff222222),
                                                        fontFamily: Assets.fontsMetropolisRegular,
                                                        fontWeight: FontWeight.w400,
                                                      )),
                                                      const SizedBox(width: 13,),
                                                      const Text("Size: " , style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff9B9B9B),
                                                        fontFamily: Assets.fontsMetropolisRegular,
                                                        fontWeight: FontWeight.w400,
                                                      )),
                                                      Text(product.size , style: const TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff222222),
                                                        fontFamily: Assets.fontsMetropolisRegular,
                                                        fontWeight: FontWeight.w400,
                                                      )),
                                                    ],
                                                  ),
                                                  Spacer(),Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: (){setState(() {
                                                          if (product.quantity > 0) {
                                                            product.quantity--;
                                                          }
                                                        });},
                                                        child: Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors.grey.shade300, //New
                                                                  blurRadius: 25.0,
                                                                  offset: Offset(0, 10))
                                                            ],
                                                            shape: BoxShape.circle,
                                                            color: Colors.white,

                                                          ),
                                                          child: Icon(Icons.remove,size: 24,color: Colors.grey,),
                                                        ),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                        child: Text(product.quantity.toString() , style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Color(0xff222222),
                                                          fontFamily: Assets.fontsMetropolisRegular,
                                                          fontWeight: FontWeight.w500,
                                                        )),
                                                      ),
                                                      InkWell(
                                                        onTap: (){setState(() {

                                                          product.quantity++;

                                                        });},
                                                        child: Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors.grey.shade300, //New
                                                                  blurRadius: 25.0,
                                                                  offset: Offset(0, 10))
                                                            ],
                                                            shape: BoxShape.circle,
                                                            color: Colors.white,

                                                          ),
                                                          child: Icon(Icons.add,size: 24,color: Colors.grey,),
                                                        ),
                                                      ),
                                                      //Spacer(),

                                                    ],
                                                  ),
                                                  const SizedBox(height: 12,)

                                                ],
                                              ),
                                              const Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 12, top: 10 , right: 20),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    const Icon(CupertinoIcons.ellipsis_vertical,size: 24,color: Color(0xff9B9B9B),),
                                                    const Spacer(),
                                                    Text("${product.price.toStringAsFixed(0)}\$" , style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff222222),
                                                      fontFamily: Assets.fontsMetropolisRegular,
                                                      fontWeight: FontWeight.w500,
                                                    )),


                                                  ],
                                                ),
                                              ),

                                            ],
                                          )
                                      ),
                                    ),
                                    const SizedBox(height: 24,)
                                  ],
                                );
                              }

                          ),
                        ),
                        const SizedBox(height: 200,)


                      ],
                    )

                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffF9F9F9),
                    child: Column(
                      children: [
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            const Text("Total Amount", style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff9B9B9B),
                              fontFamily: Assets.fontsMetropolisRegular,
                              fontWeight: FontWeight.w500,
                            )),
                            const Spacer(),
                            Text("${getTotalPrice().toStringAsFixed(0)}\$",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff222222),
                                  fontFamily: Assets.fontsMetropolisRegular,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        InkWell(
                          onTap: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Congratulations! Your order has been checked out.'),
                              ),
                            );
                          },
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xffDB3022),
                            ),
                            child: const Text("CHECK OUT", style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffffffff),
                              fontFamily: Assets.fontsMetropolisRegular,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ),
                        const SizedBox(height: 20,),

                      ],
                    ),
                  ))
            ],

          ),
        );
      }

    }
        ),

      ),
    );


  }
}
