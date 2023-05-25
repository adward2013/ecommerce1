class OrdersModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersCoupon;
  int? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersDatetime;

  OrdersModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersDatetime});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersDatetime = json['orders_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_datetime'] = this.ordersDatetime;
    return data;
  }
}