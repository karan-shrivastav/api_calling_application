class UserModel {
  String? s0;
  String? s1;
  bool? success;
  List<Data>? data;
  UserModel({this.s0, this.s1, this.success, this.data});
  UserModel.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = s0;
    data['1'] = s1;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? contact;
  String? profilePic;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.contact,
        this.profilePic,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    profilePic = json['profilePic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['contact'] = contact;
    data['profilePic'] = profilePic;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
