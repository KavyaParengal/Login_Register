class ClientModel {
  int? id;
  String? firstName;
  String? lastName;
  String? location;
  Null? age;
  String? mobile;
  String? email;
  bool? subscribed;

  ClientModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.location,
        this.age,
        this.mobile,
        this.email,
        this.subscribed});

  ClientModel.fromJson(Map<String, dynamic> json) {
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