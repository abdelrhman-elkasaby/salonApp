class ModelNotification {
  String key;
  String value;
  List<DataListBean> data;

  ModelNotification({this.key, this.value, this.data});

  ModelNotification.fromJson(Map<String, dynamic> json) {    
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
  String id;
  String type;
  String title;
  String name;
  String msg;
  String status;
  String time;
  int provider;
  int reservationId;

  DataListBean({this.id, this.type, this.title, this.name, this.msg, this.status, this.time, this.provider, this.reservationId});

  DataListBean.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.type = json['type'];
    this.title = json['title'];
    this.name = json['name'];
    this.msg = json['msg'];
    this.status = json['status'];
    this.time = json['time'];
    this.provider = json['provider'];
    this.reservationId = json['reservation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['name'] = this.name;
    data['msg'] = this.msg;
    data['status'] = this.status;
    data['time'] = this.time;
    data['provider'] = this.provider;
    data['reservation_id'] = this.reservationId;
    return data;
  }
}
