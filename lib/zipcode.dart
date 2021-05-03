class Zipcode {
  String addr;
  String post;

  Zipcode({this.addr, this.post});

  Zipcode.fromJson(Map<String, dynamic> json) {
    addr = json['addr'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addr'] = this.addr;
    data['post'] = this.post;
    return data;
  }
}