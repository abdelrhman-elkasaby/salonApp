class ModelProfile {
  String key;
  String value;
  DataBean data;

  ModelProfile({this.key, this.value, this.data});

  ModelProfile.fromJson(Map<String, dynamic> json) {    
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
  String name;
  String phone;
  String type;
  String image;
  String active;
  String confirm;
  String notifications;
  int id;

  DataBean({this.name, this.phone, this.type, this.image, this.active, this.confirm, this.notifications, this.id});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.phone = json['phone'];
    this.type = json['type'];
    this.image = json['image'];
    this.active = json['active'];
    this.confirm = json['confirm'];
    this.notifications = json['notifications'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['image'] = this.image;
    data['active'] = this.active;
    data['confirm'] = this.confirm;
    data['notifications'] = this.notifications;
    data['id'] = this.id;
    return data;
  }
}
