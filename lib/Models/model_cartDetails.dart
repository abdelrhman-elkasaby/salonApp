class ModelCartDetails {
  String key;
  String value;
  int total;
  DataBean data;

  ModelCartDetails({this.key, this.value, this.total, this.data});

  ModelCartDetails.fromJson(Map<String, dynamic> json) {    
    this.key = json['key'];
    this.value = json['value'];
    this.total = json['total'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

}

class DataBean {
  ProviderBean provider;
  List<CartsListBean> carts;

  DataBean({this.provider, this.carts});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.provider = json['provider'] != null ? ProviderBean.fromJson(json['provider']) : null;
    this.carts = (json['carts'] as List)!=null?(json['carts'] as List).map((i) => CartsListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provider != null) {
      data['provider'] = this.provider.toJson();
    }
    data['carts'] = this.carts != null?this.carts.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class ProviderBean {
  String image;
  String name;
  String address;
  int id;
  int rate;

  ProviderBean({this.image, this.name, this.address, this.id, this.rate});

  ProviderBean.fromJson(Map<String, dynamic> json) {    
    this.image = json['image'];
    this.name = json['name'];
    this.address = json['address'];
    this.id = json['id'];
    this.rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['address'] = this.address;
    data['id'] = this.id;
    data['rate'] = this.rate;
    return data;
  }
}

class CartsListBean {
  String name;
  String date;
  String time;
  int id;
  int price;

  CartsListBean({this.name, this.date, this.time, this.id, this.price});

  CartsListBean.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.date = json['date'];
    this.time = json['time'];
    this.id = json['id'];
    this.price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['time'] = this.time;
    data['id'] = this.id;
    data['price'] = this.price;
    return data;
  }
}
