import 'dart:async';

import 'package:flutter/material.dart';


class StreamControllerExample extends StatefulWidget {
  const StreamControllerExample({super.key});

  @override
  State<StreamControllerExample> createState() => _StreamControllerExampleState();
}

class _StreamControllerExampleState extends State<StreamControllerExample> {

  StreamController<String> streamController = StreamController();
  late Stream<String> dataStream;
  TextEditingController textEditingController =TextEditingController();


  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          StreamBuilder<String>(
            stream: dataStream,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Text(snapshot.data ?? '');
              }else{
                return const Text('initial');
              }
            }
          ),
          StreamBuilder<String>(
            stream: dataStream,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Text(snapshot.data ?? '');
              }else{
                return const Text('initial');
              }
            }
          ),
          const SizedBox(height: 10),
          TextField(
            controller: textEditingController,
          ),
          ElevatedButton(
              onPressed: (){
               streamController.add(textEditingController.text);
              },
              child: const Text('done'))
        ],
      ),
    );
  }
}
