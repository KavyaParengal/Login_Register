
class BannerModel {
  int? id;
  String? banners;
  int? order;

  BannerModel({this.id, this.banners, this.order});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banners = json['banners'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banners'] = this.banners;
    data['order'] = this.order;
    return data;
  }
}