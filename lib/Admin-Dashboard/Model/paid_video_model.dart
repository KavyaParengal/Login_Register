class AdminViewPaidVideoModel {
  int? id;
  String? video;
  String? title;
  String? discription;
  String? advice;
  int? month;

  AdminViewPaidVideoModel(
      {this.id,
        this.video,
        this.title,
        this.discription,
        this.advice,
        this.month});

  AdminViewPaidVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
    title = json['title'];
    discription = json['discription'];
    advice = json['advice'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['advice'] = this.advice;
    data['month'] = this.month;
    return data;
  }
}