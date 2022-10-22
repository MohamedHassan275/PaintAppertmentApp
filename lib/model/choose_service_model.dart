class ChooseServiceModel {
  bool? success;
  List<ChooseServiceResponseModel>? data;
  String? message;

  ChooseServiceModel({this.success, this.data, this.message});

  ChooseServiceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ChooseServiceResponseModel>[];
      json['data'].forEach((v) {
        data!.add(ChooseServiceResponseModel.fromJson(v));
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

class ChooseServiceResponseModel {
  int? id;
  String? name;

  ChooseServiceResponseModel({this.id, this.name});

  ChooseServiceResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
