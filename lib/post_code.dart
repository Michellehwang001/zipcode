class PostCode {
  String addr;
  String zipcode;

  PostCode(this.addr, this.zipcode);

  // factory PostCode.fromJson(Map<String, dynamic> json) {
  //   return PostCode(
  //     addr: json['addr'] as String,
  //     id: json['id'] as int,
  //     title: json['title'] as String,
  //     url: json['url'] as String,
  //     thumbnailUrl: json['thumbnailUrl'] as String,
  //   );
  // }
}