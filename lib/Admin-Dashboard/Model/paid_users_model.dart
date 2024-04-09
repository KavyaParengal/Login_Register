class PaidUserModel {
  String? id;
  String? plan;
  String? date;

  PaidUserModel({this.id, this.plan, this.date});

  PaidUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plan = json['plan'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan'] = this.plan;
    data['date'] = this.date;
    return data;
  }
}
