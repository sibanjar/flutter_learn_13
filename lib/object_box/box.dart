
import 'package:flutter_learn_13/object_box/user_model.dart';
import 'package:flutter_learn_13/object_box/user_model_box.dart';

import '../main.dart';
class UBox {

  addBulkUsers(List<UserModel> users){
    objectBox.userBox.removeAll();
    objectBox.addressBox.removeAll();

    for (final user in users) {
      var userToAdd = createUserBox(user);

      var addressToAdd = createAddBox(user);

        userToAdd.address.target=addressToAdd;
      objectBox.userBox.put(userToAdd);
      print('----+++${addressToAdd.city}');
      objectBox.addressBox.put(addressToAdd);
    }
  }

  List<UserBox> getAllUsers(){
    final userBox = objectBox.store.box<UserBox>();
    final existing = userBox.getAll();
    return existing;
  }

  List<AddressBox> getAllAddress(){
    final addressBox = objectBox.store.box<AddressBox>();
    final existing = addressBox.getAll();
    return existing;
  }

  List<UserModel> getAllUsersModel(){
    final userBox = objectBox.store.box<UserBox>();
    final addressBox = objectBox.store.box<AddressBox>();

    final allUser = userBox.getAll();
    List<UserModel> users = [];

    for(var user in allUser){
      var address = user.address.target;
      var value = UserModel.fromObjectBox(user,address!);
      users.add(value);
    }

    return users;
  }


  UserBox createUserBox(UserModel user) {
      return UserBox(
        user.id,
        name: user.name,
        username:user.username,
        email:user.email,
        website: user.website,
        phone: user.phone,
      );
  }

  AddressBox createAddBox(UserModel user) {
    return AddressBox(
      street: user.address?.street!,
      suite: user.address?.suite!,
      city: user.address?.city!,
      zipcode: user.address?.zipcode!,
    );
  }



}