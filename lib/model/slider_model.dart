class SliderModel {
  late String image;

  SliderModel(this.image);

  SliderModel.fromJson(Map<String,dynamic> json){
    json['image'] = image;
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = new Map<String,dynamic>();
    data['image'] = image;
    return data;
  }

}