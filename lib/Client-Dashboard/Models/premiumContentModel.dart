
class PremiumContentDataModel {
  int? id;
  String? video;
  String? title;
  int? month;

  PremiumContentDataModel({this.id, this.video, this.title, this.month});

  PremiumContentDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
    title = json['title'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['title'] = this.title;
    data['month'] = this.month;
    return data;
  }
}