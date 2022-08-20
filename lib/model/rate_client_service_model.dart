
class RateClientServiceModel {

  String? nameClient;
  String? dateTime;
  double? rateClient;
  String? comment;

  RateClientServiceModel(this.nameClient,this.dateTime,this.rateClient,this.comment);

  RateClientServiceModel.fromJson(Map<String,dynamic> json){
    json['name'] = nameClient;
    json['dateTime'] = dateTime;
    json['rateClient'] = rateClient;
    json['comment'] = comment;
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['name'] = nameClient;
    data['dateTime'] = dateTime;
    data['rateClient'] = rateClient;
    data['comment'] = comment;
    return data;
  }

}