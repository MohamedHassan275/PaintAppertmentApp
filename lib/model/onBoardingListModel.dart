
class OnBoardingListModel {
  String? title;

  OnBoardingListModel({this.title});

  OnBoardingListModel.fromJson (Map<String, dynamic> json){
    title = json['title'];
  }


  Map<String, dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['title'] = this.title;
    return data;
  }

}