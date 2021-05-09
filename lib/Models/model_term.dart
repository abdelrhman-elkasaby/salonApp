class ModelTerm {
  String key;
  String value;
  String data;

  ModelTerm({this.key, this.value, this.data});

  ModelTerm.fromJson(Map<String, dynamic> json) {    
    this.key = json['key'];
    this.value = json['value'];
    this.data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['data'] = this.data;
    return data;
  }

}
