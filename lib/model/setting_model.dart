class SettingModel {
  bool? success;
  SettingResponseModel? settingResponseModel;
  String? message;

  SettingModel({this.success, this.settingResponseModel, this.message});

  SettingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    settingResponseModel = json['data'] != null ? new SettingResponseModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.settingResponseModel != null) {
      data['data'] = this.settingResponseModel!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class SettingResponseModel {
  Policy? policy;
  Privacy? privacy;
  About? about;
  List<Socialmedia>? socialmedia;

  SettingResponseModel({this.policy, this.privacy, this.about, this.socialmedia});

  SettingResponseModel.fromJson(Map<String, dynamic> json) {
    policy =
    json['policy'] != null ? new Policy.fromJson(json['policy']) : null;
    privacy =
    json['privacy'] != null ? new Privacy.fromJson(json['privacy']) : null;
    about = json['about'] != null ? new About.fromJson(json['about']) : null;
    if (json['socialmedia'] != null) {
      socialmedia = <Socialmedia>[];
      json['socialmedia'].forEach((v) {
        socialmedia!.add(new Socialmedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.policy != null) {
      data['policy'] = this.policy!.toJson();
    }
    if (this.privacy != null) {
      data['privacy'] = this.privacy!.toJson();
    }
    if (this.about != null) {
      data['about'] = this.about!.toJson();
    }
    if (this.socialmedia != null) {
      data['socialmedia'] = this.socialmedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Policy {
  String? policy;

  Policy({this.policy});

  Policy.fromJson(Map<String, dynamic> json) {
    policy = json['policy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['policy'] = this.policy;
    return data;
  }
}

class Privacy {
  String? privacy;

  Privacy({this.privacy});

  Privacy.fromJson(Map<String, dynamic> json) {
    privacy = json['privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy'] = this.privacy;
    return data;
  }
}

class About {
  String? about;

  About({this.about});

  About.fromJson(Map<String, dynamic> json) {
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    return data;
  }
}

class Socialmedia {
  String? whatsapp;
  String? instagram;
  String? twitter;
  String? snapchat;
  String? phoneNumbers;

  Socialmedia({this.whatsapp, this.instagram, this.twitter, this.snapchat,this.phoneNumbers});

  Socialmedia.fromJson(Map<String, dynamic> json) {
    whatsapp = json['whatsapp'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
    phoneNumbers = json['phone_numbers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whatsapp'] = this.whatsapp;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['snapchat'] = this.snapchat;
    data['phone_numbers'] = this.phoneNumbers;
    return data;
  }
}
