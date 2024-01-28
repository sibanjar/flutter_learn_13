import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../dropdown_test/test.dart';


class DropdownTest extends StatefulWidget {
  const DropdownTest({super.key});

  @override
  State<DropdownTest> createState() => _DropdownTestState();
}

class _DropdownTestState extends State<DropdownTest> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  String? selectedOptions;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(color:Colors.red,height: 120,),
            Container(color:Colors.black,height: 120),
            Container(color:Colors.blue,height: 120),
            Container(color:Colors.tealAccent,height: 120),
            Container(color:Colors.red,height: 120,),
            Container(color:Colors.black,height: 120),
            Container(color:Colors.blue,height: 120),
            Container(color:Colors.tealAccent,height: 120),
            Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 140,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
            Container(height: 200,
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height:200,
                  width: 300,
                  child: ListView(
                    shrinkWrap: true,
                    controller: scrollController ,
                    children: [
                      DropdownMenu<String>(
                      controller: textController,
                      width: 300,
                      menuHeight: 200.0,
                      leadingIcon: const Icon(Icons.account_circle_outlined),
                      requestFocusOnTap: true,
                      enableSearch: true,
                      label: const Text('option'),
                      onSelected: (String? item) {
                        setState(() {
                          selectedOptions = item;
                        });
                      },
                      dropdownMenuEntries: items
                          .map<DropdownMenuEntry<String>>(
                              (String item) {
                            return DropdownMenuEntry<String>(

                              value: item,
                              label: item,
                            );
                          }).toList(),
                    ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
            Container(color:Colors.red,height: 120,),
            Container(color:Colors.black,height: 120),
            Container(color:Colors.blue,height: 120),
            Container(color:Colors.tealAccent,height: 120),
          ],
        ),
      ),
    );
  }
}
