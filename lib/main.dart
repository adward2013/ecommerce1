


import 'package:ecommerce/view/chat/providers/chats_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


import 'binding/intialbindings.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';
import 'view/chat/providers/models_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),      ],
      child: GetMaterialApp(
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
    
    
        title: 'Ecommerce',
        locale: controller.Language,
        theme: controller.appTheme ,
    
    
    
    
    
        // home:
        //   Test(),
        //  const Language(),
        initialBinding: InitialBindings(),
        // initialBinding: MyBinding(),
        // routes: routs,// This trailing comma makes auto-formatting nicer for build methods.
        getPages: routes,
    
      ),
    );
  }
}

