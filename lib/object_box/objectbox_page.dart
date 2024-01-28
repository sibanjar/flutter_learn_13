import 'package:flutter/material.dart';
import 'package:flutter_learn_13/object_box/box.dart';
import 'package:flutter_learn_13/object_box/provider.dart';
import 'package:flutter_learn_13/object_box/user_model.dart';

class BoxPage extends StatefulWidget {
   BoxPage({super.key});

  @override
  State<BoxPage> createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
  UserProvider userProvider =UserProvider();
  UBox userbox = UBox();
  List<UserModel> users=[];

  @override
  void initState() {
    userProvider.fetchFromApi();
    users = userbox.getAllUsersModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Object Box Learn'),),
      body: SafeArea(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context,index){
              // final address = users[index].address.target;
              // final street = address!.street! ;

              return Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1)
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(users[index].name!),
                          Text(users[index].email!),
                          Text(users[index].phone!),
                          Text(users[index].username!),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(users[index].address!.street!),
                        Text(users[index].address!.city!),
                      ],
                    ),
                  ],
                ),
              );

            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),

      ),
    );
  }
}
