class ModelProvider {
  String key;
  String value;
  DataBean data;

  ModelProvider({this.key, this.value, this.data});

  ModelProvider.fromJson(Map<String, dynamic> json) {    
    this.key = json['key'];
    this.value = json['value'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

}

class DataBean {
  InfoBean info;
  List<ServicesListBean> services;

  DataBean({this.info, this.services});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.info = json['info'] != null ? InfoBean.fromJson(json['info']) : null;
    this.services = (json['services'] as List)!=null?(json['services'] as List).map((i) => ServicesListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    data['services'] = this.services != null?this.services.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class InfoBean {
  String image;
  String name;
  String address;
  String description;
  String lat;
  String lng;
  String startTime;
  String endTime;
  int rate;

  InfoBean({this.image, this.name, this.address, this.description, this.lat, this.lng, this.startTime, this.endTime, this.rate});

  InfoBean.fromJson(Map<String, dynamic> json) {    
    this.image = json['image'];
    this.name = json['name'];
    this.address = json['address'];
    this.description = json['description'];
    this.lat = json['lat'];
    this.lng = json['lng'];
    this.startTime = json['start_time'];
    this.endTime = json['end_time'];
    this.rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['rate'] = this.rate;
    return data;
  }
}

class ServicesListBean {
  String name;
  int id;
  List<TypesListBean> types;

  ServicesListBean({this.name, this.id, this.types});

  ServicesListBean.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.id = json['id'];
    this.types = (json['types'] as List)!=null?(json['types'] as List).map((i) => TypesListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['types'] = this.types != null?this.types.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class TypesListBean {
  String name;
  bool cart;
  int id;
  int price;
  int duration;

  TypesListBean({this.name, this.cart, this.id, this.price, this.duration});

  TypesListBean.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.cart = json['cart'];
    this.id = json['id'];
    this.price = json['price'];
    this.duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cart'] = this.cart;
    data['id'] = this.id;
    data['price'] = this.price;
    data['duration'] = this.duration;
    return data;
  }
}
