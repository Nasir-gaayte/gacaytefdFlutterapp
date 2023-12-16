class Categories {
  int? id;
  String? name;
  String? img;

  Categories({this.id, this.name, this.img});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    return data;
  }
}
