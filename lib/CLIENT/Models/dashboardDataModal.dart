class DashbordDataModel {
  ClientDetails? clientDetails;
  int? currentMonth;
  Detail? detail;
  List<int>? date;

  DashbordDataModel(
      {this.clientDetails, this.currentMonth, this.detail, this.date});

  DashbordDataModel.fromJson(Map<String, dynamic> json) {
    clientDetails = json['client_details'] != null
        ? new ClientDetails.fromJson(json['client_details'])
        : null;
    currentMonth = json['current_month'];
    detail =
    json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
    date = json['date'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientDetails != null) {
      data['client_details'] = this.clientDetails!.toJson();
    }
    data['current_month'] = this.currentMonth;
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['date'] = this.date;
    return data;
  }
}

class ClientDetails {
  int? id;
  String? firstName;
  String? lastName;
  String? location;
  Null? age;
  String? mobile;
  String? email;
  bool? subscribed;

  ClientDetails(
      {this.id,
        this.firstName,
        this.lastName,
        this.location,
        this.age,
        this.mobile,
        this.email,
        this.subscribed});

  ClientDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    location = json['location'];
    age = json['age'];
    mobile = json['mobile'];
    email = json['email'];
    subscribed = json['subscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['location'] = this.location;
    data['age'] = this.age;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['subscribed'] = this.subscribed;
    return data;
  }
}

class Detail {
  int? id;
  int? month;
  String? description;
  String? image;
  String? length;
  String? size;
  String? weight;

  Detail(
      {this.id,
        this.month,
        this.description,
        this.image,
        this.length,
        this.size,
        this.weight});

  Detail.fromJson(Map<String, dynamic> json) {
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