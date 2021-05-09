class ModelMyCart {
  String key;
  String value;
  List<DataListBean> data;

  ModelMyCart({this.key, this.value, this.data});

  ModelMyCart.fromJson(Map<String, dynamic> json) {    
    this.key = json['key'];
    this.value = json['value'];
    this.data = (json['data'] as List)!=null?(json['data'] as List).map((i) => DataListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['data'] = this.data != null?this.data.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class DataListBean {
  String image;
  String name;
  String address;
  int providerId;
  int rate;

  DataListBean({this.image, this.name, this.address, this.providerId, this.rate});

  DataListBean.fromJson(Map<String, dynamic> json) {    
    this.image = json['image'];
    this.name = json['name'];
    this.address = json['address'];
    this.providerId = json['provider_id'];
    this.rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['address'] = this.address;
    data['provider_id'] = this.providerId;
    data['rate'] = this.rate;
    return data;
  }
}
