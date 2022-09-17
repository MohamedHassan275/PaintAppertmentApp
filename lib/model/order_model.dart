class OrderModel {
  bool? success;
  List<OrderResponseModel>? data;
  String? message;

  OrderModel({this.success, this.data, this.message});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <OrderResponseModel>[];
      json['data'].forEach((v) {
        data!.add(new OrderResponseModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class OrderResponseModel {
  int? id;
  dynamic service;
  dynamic technicalName;
  String? orderNumber;
  String? flatArea;
  String? rooms;
  String? bathrooms;
  String? firstname;
  String? lastname;
  String? phone;
  String? governorate;
  String? city;
  dynamic offerCost;
  String? status;

  OrderResponseModel(
      {this.id,
        this.service,
        this.technicalName,
        this.orderNumber,
        this.flatArea,
        this.rooms,
        this.bathrooms,
        this.firstname,
        this.lastname,
        this.phone,
        this.governorate,
        this.city,
        this.offerCost,
        this.status});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service = json['service'];
    technicalName = json['technical_name'];
    orderNumber = json['order_number'];
    flatArea = json['flat_area'];
    rooms = json['rooms'];
    bathrooms = json['bathrooms'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    governorate = json['governorate'];
    city = json['city'];
    offerCost = json['offer_cost'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service'] = this.service;
    data['technical_name'] = this.technicalName;
    data['order_number'] = this.orderNumber;
    data['flat_area'] = this.flatArea;
    data['rooms'] = this.rooms;
    data['bathrooms'] = this.bathrooms;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['governorate'] = this.governorate;
    data['city'] = this.city;
    data['offer_cost'] = this.offerCost;
    data['status'] = this.status;
    return data;
  }
}
