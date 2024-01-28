
import 'package:flutter_learn_13/object_box/user_model_box.dart';

class UserModel {
  int id =0;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;

  UserModel(this.id,
      {
        this.name,
        this.username,
        this.email,
        this.phone,
        this.website,
        this.address,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    address =
    json['address'] != null ?  Address.fromJson(json['address']) : null;
  }
  UserModel.fromObjectBox(UserBox user, AddressBox addre) {
     id =0;
     name = user.name;

     username=user.username ;

     email=user.email;

     phone=user.phone;

     website=user.website;

     address = Address.fromObjectBox(addre);
  }
}

class Address {
  int id =0;
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  Address({this.street, this.suite, this.city, this.zipcode,});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
  }

  Address.fromObjectBox(AddressBox address){
    zipcode = address.zipcode;
    city = address.city;
    suite = address.suite;
    street = address.street;
  }


}

