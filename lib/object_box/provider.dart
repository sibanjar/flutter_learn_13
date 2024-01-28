import 'package:flutter_learn_13/object_box/box.dart';
import 'package:flutter_learn_13/object_box/repo.dart';
import 'package:flutter_learn_13/object_box/user_model.dart';
import 'package:flutter_learn_13/object_box/user_model_box.dart';

class UserProvider{

  UBox usersBox =UBox();
  List<UserModel>? users;

  void fetchFromApi(){
    UserRepo.fetchFromApi().then((value) {
      usersBox.addBulkUsers(value);
    }).catchError((error) {
      print('$error');
    });
  //   users= await UserRepo.fetchFromApi();
  //   if(users==null){
  //     print('list is null');
  //   }else{
  //   usersBox.addBulkUsers(users!);
  // }
  }


}