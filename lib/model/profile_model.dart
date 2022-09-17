class ProfileModel {
  bool? success;
  ProfileResponseModel? data;
  String? message;

  ProfileModel({this.success, this.data, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new ProfileResponseModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProfileResponseModel {
  int? id;
  String? type;
  Null? service;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? image;

  ProfileResponseModel(
      {this.id,
        this.type,
        this.service,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.image});

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    service = json['service'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['service'] = this.service;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    return data;
  }
}
