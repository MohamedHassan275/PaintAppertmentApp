
class MyWaitingOrderModel {
  String? company;
  String? orderNumber;
  String? castingType;
  String? executionDate;
  String? qtyM;
  String? mixType;
  String? cementType;
  String? address;

  MyWaitingOrderModel(this.company,
      this.orderNumber,
      this.castingType,
      this.executionDate,
      this.qtyM,
      this.mixType,
      this.cementType,
      this.address);

  MyWaitingOrderModel.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    orderNumber = json['order_number'];
    castingType = json['casting_type'];
    executionDate = json['execution_date'];
    qtyM = json['qty_m'];
    mixType = json['mix_type'];
    cementType = json['cement_type'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> myOrderResponseModel =
    new Map<String, dynamic>();
    myOrderResponseModel['company'] = this.company;
    myOrderResponseModel['order_number'] = this.orderNumber;
    myOrderResponseModel['casting_type'] = this.castingType;
    myOrderResponseModel['execution_date'] = this.executionDate;
    myOrderResponseModel['qty_m'] = this.qtyM;
    myOrderResponseModel['mix_type'] = this.mixType;
    myOrderResponseModel['cement_type'] = this.cementType;
    myOrderResponseModel['address'] = this.address;
    return myOrderResponseModel;
  }
}