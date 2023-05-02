import 'package:ecommerce/controller/homescreen.dart';
import 'package:ecommerce/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeScreenControllerImp>(builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length + 1, ((index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomButtomAppBar(
                            textbuttom: controller.buttomappbar[i]['title'],
                            iconData: controller.buttomappbar[i]['icon'],
                            active:
                                controller.currentpage == i ? true : false,
                            onPressed: () {
                              controller
                                  .chanePage(i);
                            },
                          );
                  }))
                ],
              ),
            ));
  }
}