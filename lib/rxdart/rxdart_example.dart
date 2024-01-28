import 'package:flutter/material.dart';
import 'package:flutter_learn_13/rxdart/validator.dart';

class RxdartExample extends StatelessWidget {
  const RxdartExample({super.key});

  @override
  Widget build(BuildContext context) {
    final validation = Validator();
    return Scaffold(
      appBar: AppBar(title: const Text('rxdart'),),
      body: Column(
        children: [
          StreamBuilder(
              stream:validation.email,
              builder: ((context,snapshot)=>
                TextField(
                  onChanged: (val) => validation.sinkemail.add(val),
                  decoration: InputDecoration(
                    hintText:  'Email',
                    errorText: snapshot.hasError ? snapshot.error.toString() : null
                  ),
                )
              )
          ),
          StreamBuilder(
              stream:validation.message,
              builder: ((context,snapshot)=>
                TextField(
                  onChanged: (val) => validation.sinkMessage.add(val),
                  decoration: InputDecoration(
                    hintText:  'Message',
                    errorText: snapshot.hasError ? snapshot.error.toString() : null
                  ),
                )
              )
          ),
          StreamBuilder(
              stream:validation.submitValid,
              builder: ((context,snapshot)=>
                ElevatedButton(
                    onPressed: snapshot.data != true ? (){} : (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: snapshot.data!=true ? Colors.grey : Colors.red
                    ),
                    child: const Text("Subscribe"))
              )
          ),

        ],
      ),
    );
  }
}
