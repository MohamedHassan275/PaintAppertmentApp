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
        data!.add(OrderResponseModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class OrderResponseModel {
  int? id;
  dynamic orderId;
  String? title;
  dynamic body;
  String? serviceId;
  String? service;
  String? technicalName;
  String? orderNumber;
  String? flatArea;
  String? rooms;
  String? bathrooms;
  String? description;
  String? firstname;
  String? lastname;
  String? phone;
  String? governorate;
  String? city;
  dynamic offerCost;
  dynamic status;
  int? offer;

  OrderResponseModel(
      {this.id,
        this.orderId,
        this.service,
        this.title,
        this.body,
        this.serviceId,
        this.technicalName,
        this.orderNumber,
        this.flatArea,
        this.rooms,
        this.bathrooms,
        this.description,
        this.firstname,
        this.lastname,
        this.phone,
        this.governorate,
        this.city,
        this.offerCost,
        this.status,
        this.offer});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    service = json['service'];
    title = json['title'];
    serviceId = json['service_id'];
    body = json['body'];
    technicalName = json['technical_name'];
    orderNumber = json['order_number'];
    flatArea = json['flat_area'];
    rooms = json['rooms'];
    bathrooms = json['bathrooms'];
    description = json['description'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    governorate = json['governorate'];
    city = json['city'];
    offerCost = json['offer_cost'];
    status = json['status'];
    offer = json['offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['service'] = service;
    data['title'] = title;
    data['body'] = body;
    data['service_id'] = serviceId;
    data['technical_name'] = technicalName;
    data['order_number'] = orderNumber;
    data['flat_area'] = flatArea;
    data['rooms'] = rooms;
    data['bathrooms'] = bathrooms;
    data['description'] = description;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phone'] = phone;
    data['governorate'] = governorate;
    data['city'] = city;
    data['offer_cost'] = offerCost;
    data['status'] = status;
    data['offer'] = offer;
    return data;
  }
}
