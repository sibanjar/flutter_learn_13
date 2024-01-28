import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'];
  final TextEditingController textController = TextEditingController();
  String? selectedOptions;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: 700,
            width: 350,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Container(color:Colors.red,height: 150,),
                Container(color:Colors.blue,height: 150),
                Container(color:Colors.black,height: 150),
                Container(color:Colors.blue,height: 150),
                Container(color:Colors.tealAccent,height: 150),
                Container(height: 200,
                  color: Colors.orange,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 50,
                        bottom: 0,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  DropdownMenu<String>(
                                    controller: textController,
                                    width: 300,
                                    menuHeight: 200.0,
                                    leadingIcon: const Icon(Icons.account_circle_outlined),
                                    requestFocusOnTap: true,
                                    enableSearch: true,
                                    label: const Text('option'),
                                    onSelected: (String? option) {
                                      setState(() {
                                        selectedOptions = option;
                                      });
                                    },
                                    dropdownMenuEntries: options
                                        .map<DropdownMenuEntry<String>>(
                                            (String option) {
                                          return DropdownMenuEntry<String>(
                                            style: ButtonStyle(

                                            ),
                                            value: option,
                                            label: option,
                                          );
                                        }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
                Container(color:Colors.black,height: 150),
                Container(color:Colors.blue,height: 150),
                Container(color:Colors.tealAccent,height: 150),

              ],
            ),
          ),
        ),

    );
  }
}


class MyDropdownWidget extends StatefulWidget {
  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String _selectedItem = 'Option 1'; // Initially selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Example'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _selectedItem,
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue!;
            });
          },
          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
