

class PurchaseRecordEntity{

  String name;
  int customerType;  //1 : 储值用户  2:现金用户
  int accountType; // 1 :vip  2:   weichat  3: alipay
  int purchaseCount;
  int purchaseAmountSum;

  PurchaseRecordEntity(this.name, this.customerType, this.accountType,
      this.purchaseCount, this.purchaseAmountSum);


}