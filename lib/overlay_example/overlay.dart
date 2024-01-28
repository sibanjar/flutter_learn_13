import 'package:flutter/material.dart';

import 'overlay_widget.dart';
class OverlayExample extends StatefulWidget {
  const OverlayExample({super.key});

  @override
  State<OverlayExample> createState() => _OverlayExampleState();
}

class _OverlayExampleState extends State<OverlayExample> {
  List<String> categories = ['option1','option2','option3','option4','option5'];
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overlay testing'),),
      body: SafeArea(
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(32),
          children: [
            Container(color:Colors.red,height: 120,),
            Container(color:Colors.black,height: 120),
            Container(color:Colors.blue,height: 120),
            Container(color:Colors.tealAccent,height: 120),
            Container(color:Colors.red,height: 120,),
            Container(color:Colors.black,height: 120),
            Container(color:Colors.blue,height: 120),
            Container(color:Colors.tealAccent,height: 120),
            const SizedBox(height: 12,),
            OverlayWidget(followerWidget: overlay(), targetWidget: target(), scrollController: scrollController,),
            const SizedBox(height: 12,),
            Container(color:Colors.red,height: 120,),
            Container(color:Colors.blue,height: 120),
            Container(color:Colors.black,height: 120),
            Container(color:Colors.blue,height: 120),
            Container(color:Colors.tealAccent,height: 120),
            Container(color:Colors.red,height: 120,),
            Container(color:Colors.black,height: 120),
            Container(color:Colors.blue,height: 120),
            Container(color:Colors.tealAccent,height: 120),
          ],
        ),
      )
    );
  }
 Widget overlay()=>Container(
   color:Colors.orange,
   height: 200,
   child: Column(
     children: [
       Material(
         child: Padding(
           padding: const EdgeInsets.all(5.0),
           child: TextField(
             decoration:InputDecoration(
               border:OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none,),
               hintText: 'Search items',
               hintStyle: Theme.of(context).textTheme.labelLarge,
               fillColor: Theme.of(context).colorScheme.background,
               filled: true,
               contentPadding: const EdgeInsets.all(10),
               suffixIcon: Icon(Icons.search,size: 20,color: Theme.of(context).colorScheme.onBackground,),
             ),
           ),
         ),
       ),
       Expanded(
         child: ListView.builder(
             padding: EdgeInsets.zero,
             itemCount: categories.length,
             itemBuilder: (context,index){
               return Text(categories[index],
                 style: Theme.of(context).textTheme.titleLarge,
               );
             }),
       ),
     ],
   ),
 );

  Widget target()=>ElevatedButton(
    onPressed: (){
      // showOverLay();
    },
    child: const Text('Categoryyyyy'),
  );
}
