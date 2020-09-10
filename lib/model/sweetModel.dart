class SweetModel {
  List<String> image;
  String name;
  String location;
  int item;
  int price;
  String star;
  String desc;
  String tag1;
  String tag2;

  SweetModel(
      {this.image,
      this.name,
      this.location,
      this.item,
      this.price,
      this.star,
      this.desc,
      this.tag1,
      this.tag2});

  SweetModel.fromJson(Map<String, dynamic> json) {
    image = json['image'].cast<String>();
    name = json['name'];
    location = json['location'];
    item = json['item'];
    price = json['price'];
    star = json['star'];
    desc = json['desc'];
    tag1 = json['tag1'];
    tag2 = json['tag2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['location'] = this.location;
    data['item'] = this.item;
    data['price'] = this.price;
    data['star'] = this.star;
    data['desc'] = this.desc;
    data['tag1'] = this.tag1;
    data['tag2'] = this.tag2;
    return data;
  }
}
