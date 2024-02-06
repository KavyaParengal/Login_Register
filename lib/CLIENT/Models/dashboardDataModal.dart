class DashbordDataModel {
  ClientDetails? clientDetails;
  int? currentMonth;
  List<int>? date;
  Null? dashbordDetails;

  DashbordDataModel(
      {this.clientDetails, this.currentMonth, this.date, this.dashbordDetails});

  DashbordDataModel.fromJson(Map<String, dynamic> json) {
    clientDetails = json['client_details'] != null
        ? new ClientDetails.fromJson(json['client_details'])
        : null;
    currentMonth = json['current_month'];
    date = json['date'].cast<int>()==null ? 0 : json['date'].cast<int>();
    dashbordDetails = json['dashbord_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientDetails != null) {
      data['client_details'] = this.clientDetails!.toJson();
    }
    data['current_month'] = this.currentMonth;
    data['date'] = this.date;
    data['dashbord_details'] = this.dashbordDetails;
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
    id = json['id']==null ? 0 : json['id'];
    firstName = json['first_name']==null ? '' :firstName = json['first_name'];
    lastName = json['last_name']==null ? '': json['last_name'];
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