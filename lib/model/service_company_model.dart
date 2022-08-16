
class ServiceCompanyModel {

 late String title;
 late String image;

 ServiceCompanyModel(this.title,this.image);

 ServiceCompanyModel.fromJson(Map<String,dynamic> json){
   json['title'] = title;
   json['image'] = image;
  }

  Map<String,dynamic> toJson(){
  final Map<String,dynamic> data = new Map<String,dynamic>();
  data['title'] = title;
  data['image'] = image;
   return data;
  }

}