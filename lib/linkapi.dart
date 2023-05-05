class AppLink {
  static const String server =
      "http://adwar1111-001-site1.btempurl.com/ecommerce";

  //------------------------images
  static const String image =
      "http://adwar1111-001-site1.btempurl.com/ecommerce/upload";
  static const String imagesCategories = "$image/categories";
  static const String imagesItems = "$image/items";

//------------------------------------test
  static const String test = "$server/test.php";

  //----------------------------------auth

  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycode = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

  //----------------------------------forgetpassword

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

  //----------------------------------HOME

  static const String homepage = "$server/home.php";
  //----------------------------------items

  static const String items = "$server/items/items.php";

  //----------------------------------favorite
  static const String favoriteadd = "$server/favorite/add.php";
  static const String favoriteremove = "$server/favorite/remove.php";
  static const String favoriteview = "$server/favorite/view.php";
  static const String favoritedelete = "$server/favorite/deletefavorite.php";

//----------------------------------cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartremove = "$server/cart/remove.php";
  static const String cartcountitems = "$server/cart/getcountitems.php";

}
