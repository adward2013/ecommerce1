import 'package:ecommerce/core/constant/routes.dart';

import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';

import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommerce/view/screen/auth/veifycodesignup.dart';

import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myfavorite.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/productdetails.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
  GetPage(name: "/", page: () => const Language()),
  
   //GetPage(name: "/", page: () => const Language() , middlewares: [ MyMiddleWare()]),

  //GetPage(name: "/", page: () => const ProductDetails()),
  // GetPage(name: "/", page: () => const TestView() ),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verfiycodeSignUp, page: () => const VerifyCodeSignUp()),

  // ONBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  //
  // GetPage(name: AppRoute.homepage, page: () => const HomePage() ),
  GetPage(name: AppRoute.homepage, page: () => const HomeScrean()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()),
];
