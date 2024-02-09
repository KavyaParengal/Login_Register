class PlanListModel {
  int? id;
  String? plan;
  int? price;

  PlanListModel({this.id, this.plan, this.price});

  PlanListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plan = json['plan'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan'] = this.plan;
    data['price'] = this.price;
    return data;
  }
}