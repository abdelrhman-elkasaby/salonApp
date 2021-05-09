class ModelDeleteCart {
  String key;
  String value;
  String msg;

  ModelDeleteCart({this.key, this.value, this.msg});

  ModelDeleteCart.fromJson(Map<String, dynamic> json) {    
    this.key = json['key'];
    this.value = json['value'];
    this.msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['msg'] = this.msg;
    return data;
  }

}
