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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("price" , style: TextStyle(fontSize: 17),)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("1200 \$",style: TextStyle(fontSize: 17 , fontFamily: "sans"), )),
          ],),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("shipping" , style: TextStyle(fontSize: 17),)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("200 \$",style: TextStyle(fontSize: 17 , fontFamily: "sans"), )),
          ],),
        Divider(),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Total price" , style: TextStyle(fontSize: 17, fontFamily: "sans" , fontWeight: FontWeight.bold ,color:AppColor.primaryColor ),)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("1400 \$",style: TextStyle(fontSize: 17 , fontFamily: "sans" , fontWeight: FontWeight.bold,color:AppColor.primaryColor), )),
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
        const SizedBox(height: 10,),
  Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.only(bottom: 5),
   // height: 20,
    decoration: BoxDecoration(
      color: AppColor.secoundColor,
      borderRadius: BorderRadius.circular(20)
    ),
    child: Text("You Have 2 Items In Your Cart" , textAlign: TextAlign.center,style: TextStyle(color: AppColor.white),),
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
