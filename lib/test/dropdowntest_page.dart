import 'package:flutter/material.dart';
import 'dropdowntest/person_model.dart';
import 'dropdowntest/pocket_dropdown.dart';


class TextFormWidget1 extends StatefulWidget {
  const TextFormWidget1({Key? key}) : super(key: key);

  @override
  State<TextFormWidget1> createState() => _TextFormWidget1State();
}

class _TextFormWidget1State extends State<TextFormWidget1> {
  List<String> categories = ['option1', 'option2', 'option3', 'option4', 'option5'];
  List<Person> people = [
    Person(name: 'John Doe', address: '123 Main St'),
    Person(name: 'Johnny Donith', address: '123 Main St'),
    Person(name: 'Jolly broth', address: '123 Main St'),
    Person(name: 'Alice Smith', address: '456 Elm St'),
    Person(name: 'ram dev', address: '456 Elm St'),
    Person(name: 'hel maga', address: '456 Elm St'),
  ];

  @override
  void initState() {
    super.initState();
  }

  String selectedItem = 'selectasdfadsfadfajdslfajl';

  void setSelectedItems(Person item){
     setState(() { selectedItem = item.name; });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 240,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.background),
          borderRadius: BorderRadius.circular(5),
          color: Colors.orange,
      ),
      child: Text('it is'),
      // child:PocketDropdownSearch<Person>(
      //   itemBuilder: (){
      //
      //   },
      //     items: people,
      //     isSearch: true,
      //     onChanged:setSelectedItems,
      //     child: Center(child: Text(selectedItem)),
      //
      //   ),
      );
  }
}
