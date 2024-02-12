class PlanListModel {
  int? id;
  String? plan;
  int? price;
  String? description;

  PlanListModel({this.id, this.plan, this.price, this.description});

  PlanListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plan = json['plan'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan'] = this.plan;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}