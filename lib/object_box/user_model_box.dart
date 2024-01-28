import 'package:objectbox/objectbox.dart';

@Entity()
class UserBox {
  @Id()
  int id =0;
  String? name;
  String? username;
  String? email;
  final address = ToOne<AddressBox>();
  String? phone;
  String? website;

  UserBox(this.id,
      {
        this.name,
        this.username,
        this.email,
        this.phone,
        this.website,
        // this.company
      });

  UserBox.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    // company =
    // json['company'] != null ?  Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    // if (address != null) {
    //   data['address'] = address!.toJson();
    // }
    data['phone'] = phone;
    data['website'] = website;
    // if (company != null) {
    //   data['company'] = company!.toJson();
    // }
    return data;
  }
}

@Entity()
class AddressBox {
  @Id()
  int id =0;
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  AddressBox({this.street, this.suite, this.city, this.zipcode,});

  AddressBox.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    return data;
  }
}

