class ModelOrders {
  String key;
  String value;
  DataBean data;

  ModelOrders({this.key, this.value, this.data});

  ModelOrders.fromJson(Map<String, dynamic> json) {    
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
  List<CurrentListBean> current;
  List<PreviousListBean> previous;

  DataBean({this.current, this.previous});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.current = (json['current'] as List)!=null?(json['current'] as List).map((i) => CurrentListBean.fromJson(i)).toList():null;
    this.previous = (json['previous'] as List)!=null?(json['previous'] as List).map((i) => PreviousListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current != null?this.current.map((i) => i.toJson()).toList():null;
    data['previous'] = this.previous != null?this.previous.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class CurrentListBean {
  String image;
  String name;
  String address;
  int id;
  int providerId;
  int rate;

  CurrentListBean({this.image, this.name, this.address, this.id, this.providerId, this.rate});

  CurrentListBean.fromJson(Map<String, dynamic> json) {    
    this.image = json['image'];
    this.name = json['name'];
    this.address = json['address'];
    this.id = json['id'];
    this.providerId = json['provider_id'];
    this.rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['address'] = this.address;
    data['id'] = this.id;
    data['provider_id'] = this.providerId;
    data['rate'] = this.rate;
    return data;
  }
}

class PreviousListBean {
  String image;
  String name;
  String address;
  int id;
  int providerId;
  int rate;

  PreviousListBean({this.image, this.name, this.address, this.id, this.providerId, this.rate});

  PreviousListBean.fromJson(Map<String, dynamic> json) {    
    this.image = json['image'];
    this.name = json['name'];
    this.address = json['address'];
    this.id = json['id'];
    this.providerId = json['provider_id'];
    this.rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['address'] = this.address;
    data['id'] = this.id;
    data['provider_id'] = this.providerId;
    data['rate'] = this.rate;
    return data;
  }
}
