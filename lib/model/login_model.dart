class LoginModel {
  bool? success;
  LoginResponseModel? data;
  String? message;

  LoginModel({this.success, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new LoginResponseModel.fromJson(json['data']) : null;
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

class LoginResponseModel {
  String? accesstoken;
  String? type;

  LoginResponseModel({this.accesstoken, this.type});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accesstoken = json['accesstoken'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accesstoken'] = this.accesstoken;
    data['type'] = this.type;
    return data;
  }
}
