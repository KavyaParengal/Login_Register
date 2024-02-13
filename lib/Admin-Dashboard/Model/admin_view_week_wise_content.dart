class AdminViewWeekWiseModel {
  int? id;
  int? month;
  String? description;
  String? image;
  String? length;
  String? size;
  String? weight;

  AdminViewWeekWiseModel(
      {this.id,
        this.month,
        this.description,
        this.image,
        this.length,
        this.size,
        this.weight});

  AdminViewWeekWiseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    month = json['month'];
    description = json['description'];
    image = json['image'];
    length = json['length'];
    size = json['size'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['month'] = this.month;
    data['description'] = this.description;
    data['image'] = this.image;
    data['length'] = this.length;
    data['size'] = this.size;
    data['weight'] = this.weight;
    return data;
  }
}