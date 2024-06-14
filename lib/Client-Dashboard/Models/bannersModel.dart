class BannersModel {
  List<Data>? data;

  BannersModel({this.data});

  BannersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? banners;
  int? order;

  Data({this.id, this.banners, this.order});

  Data.fromJson(Map<String, dynamic> json) {
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
