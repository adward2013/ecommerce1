class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  int? couponDiscound;
  String? couponExpiredate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscound,
      this.couponExpiredate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDiscound = json['coupon_discound'];
    couponExpiredate = json['coupon_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_discound'] = this.couponDiscound;
    data['coupon_expiredate'] = this.couponExpiredate;
    return data;
  }
}