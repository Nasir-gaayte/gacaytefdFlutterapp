class Items {
  int id;
  String item;
  String img;
  String desc;
  double price;
  String category;

  Items({
    required this.id,
    required this.item,
    required this.img,
    required this.desc,
    required this.price,
    required this.category,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'],
      item: json['item'],
      img: json['img'],
      desc: json['desc'],
      price: json['price'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['item'] = item;
    data['img'] = img;
    data['desc'] = desc;
    data['price'] = price;
    data['category'] = category;
    return data;
  }
}
