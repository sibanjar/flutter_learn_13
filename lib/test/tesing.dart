import 'package:flutter/material.dart';
import 'package:flutter_learn_13/test/testing_2.dart';


class Testing extends StatefulWidget {

   const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  ScrollController controller = ScrollController();
  AppBar appBar =  AppBar(title: const Text('TEST'));


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width*0.9;
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.red),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.black54),),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.orange),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.green),),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(height: 120,width: width,
                    child: Container(color:Colors.red),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.black54),),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.orange),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.green),),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.blue),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.red),),
                  ),
                  const SizedBox(height: 12,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(width: width,
                      child: const TextFormWidget()
                      ,),
                  ),
                  const SizedBox(height: 12,),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.tealAccent),),
                  ),
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: SizedBox(width: width,
                  //     child: const TextFormWidget(),),
                  // ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.red),),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.tealAccent),),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.blue),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.red),),
                  ),
                  const SizedBox(height: 12,),

                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.tealAccent),),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.blue),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(height: 120,width: width,
                      child: Container(color:Colors.red),),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

