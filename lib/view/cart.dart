import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imgeasset.dart';
import 'package:ecommerce/view/widget/cart/custombuttoncart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("price" , style: TextStyle(fontSize: 17),),
              Text("600 \$",style: TextStyle(fontSize: 17, fontFamily: "sans"), ),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("price" , style: TextStyle(fontSize: 17),),
              Text("600 \$",style: TextStyle(fontSize: 17, fontFamily: "sans"), ),
          ],),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 18),
             child: Divider(color: AppColor.black,),
           ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total price" , style: TextStyle(fontSize: 17),),
              Text("1200 \$",style: TextStyle(fontSize: 17 , fontFamily: "sans"), ),
          ],),
         const SizedBox(height: 10,),
          CustomButtomCart(
            
            textbutton: "place Order",
            onPressed: () {},
          )
        ],
      )),
      body: ListView(children: [
        Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_outlined),
                    )),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "My Cart",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.asset(
                            AppImageAsset.logo,
                            height: 90,
                            fit: BoxFit.cover,
                          )),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text("LAPTOP hp "),
                            subtitle: Text(
                              "300 \$",
                              style: TextStyle(
                                  fontFamily: "sans",
                                  color: AppColor.primaryColor,
                                  fontSize: 15),
                            ),
                          )),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                              height: 35,
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add))),
                          Container(
                              height: 30,
                              child: Text(
                                "2",
                                style: TextStyle(fontFamily: "sans"),
                              )),
                          Container(
                              height: 25,
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.remove))),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.asset(AppImageAsset.logo,
                              height: 90, fit: BoxFit.cover)),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text("Camera canona "),
                            subtitle: Text(
                              "300 \$",
                              style: TextStyle(
                                  fontFamily: "sans",
                                  color: AppColor.primaryColor,
                                  fontSize: 15),
                            ),
                          )),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                              height: 35,
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add))),
                          Container(
                              height: 30,
                              child: Text(
                                "2",
                                style: TextStyle(fontFamily: "sans"),
                              )),
                          Container(
                              height: 25,
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.remove))),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
