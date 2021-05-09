class HomeModel {
  String key;
  String value;
  DataBean data;

  HomeModel({this.key, this.value, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {    
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
  List<String> slider;
  List<ProvidersListBean> providers;

  DataBean({this.providers, this.slider});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.providers = (json['providers'] as List)!=null?(json['providers'] as List).map((i) => ProvidersListBean.fromJson(i)).toList():null;

    List<dynamic> sliderList = json['slider'];
    this.slider = new List();
    this.slider.addAll(sliderList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['providers'] = this.providers != null?this.providers.map((i) => i.toJson()).toList():null;
    data['slider'] = this.slider;
    return data;
  }
}

class ProvidersListBean {
  String image;
  String name;
  String address;
  int id;
  int rate;

  ProvidersListBean({this.image, this.name, this.address, this.id, this.rate});

  ProvidersListBean.fromJson(Map<String, dynamic> json) {    
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
