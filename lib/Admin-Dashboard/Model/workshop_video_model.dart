class WorkshopModel {
  int? id;
  String? video;

  WorkshopModel({this.id, this.video});

  WorkshopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    return data;
  }
}