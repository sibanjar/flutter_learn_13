import 'package:flutter/material.dart';

import '../models/scan_model.dart';

class ScanMore extends StatefulWidget {
  // selectedScanNo
  // setSelectedScanNo
  // handleScan
  const ScanMore({super.key});

  @override
  State<ScanMore> createState() => _ScanMoreState();
}

class _ScanMoreState extends State<ScanMore> {
  late GlobalKey actionKey;
  final layerLink = LayerLink();
  OverlayEntry? overlayEntry;
  bool isOverlayVisible = false;
  double overlayHeight = 260;
  String? selectedOptions;
  List<ScanMoreModel> items = [
    ScanMoreModel(id: 1, value: 1, lable: 'Label 1'),
    ScanMoreModel(id: 2, value: 2, lable: 'Label 2'),
    ScanMoreModel(id: 3, value: 3, lable: 'Label 3'),
    ScanMoreModel(id: 4, value: 4, lable: 'Label 4'),
    ScanMoreModel(id: 5, value: 5, lable: 'Label 5'),
    ScanMoreModel(id: 6, value: 6, lable: 'Label 6'),
    ScanMoreModel(id: 7, value: 7, lable: 'Label 7'),
    ScanMoreModel(id: 8, value: 8, lable: 'Label 8'),
    ScanMoreModel(id: 9, value: 9, lable: 'Label 9'),
    ScanMoreModel(id: 10, value: 10, lable: 'Label 10'),
  ];

  void setIsOverlayVisible(bool value){
    if(mounted){
      setState(() { isOverlayVisible = value; });
    }
  }

  @override
  void dispose() { // may not need
    hideOverLay();
    super.dispose();
  }

  @override
  void initState() {

    actionKey = LabeledGlobalKey('select_question_overlay');
    // TODO: implement initState
    super.initState();
  }

  void showOverLay(BuildContext context){
    final overlay = Overlay.of(context);
    final renderBox = actionKey.currentContext?.findRenderObject() as RenderBox?;
    Offset position = renderBox!.localToGlobal(Offset.zero);
    final size = renderBox.size;
    double y = position.dy;
    double x = position.dx;
    double appbarHeight = View.of(context).padding.top+15;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isOverlayBottom= false;
    bool isNoSpace = false;
    // check widget is above appbar
    if(y+size.height+overlayHeight < screenHeight){ isOverlayBottom = true; }
    else if(y-overlayHeight > appbarHeight){ isOverlayBottom = false ; }
    else{ isNoSpace= true; }

    overlayEntry = OverlayEntry(builder: (context)=> Positioned(
        width: 100.0,
        left: x, // if layerLink is not used
        top: appbarHeight, // if layerLink is not used
        child: CompositedTransformFollower(
            link: isNoSpace ? LayerLink() : layerLink,
            showWhenUnlinked: true,
            offset: Offset(0, isOverlayBottom ? size.height : -overlayHeight),
            child: buildOverLay(context))
    ));
    overlay.insert(overlayEntry!);
  }


  void hideOverLay(){
    overlayEntry?.remove();
    overlayEntry=null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan More'),),
      body: Column(
        children: [
          Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:Colors.orange
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Scan for more:',style: Theme.of(context).textTheme.titleLarge,)),
              Expanded(
                child: SizedBox(
                  height: 180,
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: OutlinedButton(onPressed: (){
                            showOverLay(context);
                        },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('5years',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                SizedBox(width: 20,),
                                Icon(Icons.arrow_drop_down),
                              ],
                            )),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        flex: 2,
                          child:ElevatedButton(
                            onPressed: () { },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('this'),
                                SizedBox(width: 10,),
                                Text('Scan Now',style:TextStyle(fontSize: 12,fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
            ),
          Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:Colors.orange
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Scan for more:',style: Theme.of(context).textTheme.titleLarge,)),
              Expanded(
                child: SizedBox(
                  height: 180,
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: OutlinedButton(onPressed: (){
                            showOverLay(context);
                        },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('5years',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                SizedBox(width: 20,),
                                Icon(Icons.arrow_drop_down),
                              ],
                            )),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        flex: 2,
                          child:ElevatedButton(
                            onPressed: () { },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('this'),
                                SizedBox(width: 10,),
                                Text('Scan Now',style:TextStyle(fontSize: 12,fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
            ),
          Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:Colors.orange
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Scan for more:',style: Theme.of(context).textTheme.titleLarge,)),
              Expanded(
                child: SizedBox(
                  height: 180,
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: OutlinedButton(onPressed: (){
                            showOverLay(context);
                        },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('5years',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                SizedBox(width: 20,),
                                Icon(Icons.arrow_drop_down),
                              ],
                            )),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        flex: 2,
                          child:ElevatedButton(
                            onPressed: () { },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('this'),
                                SizedBox(width: 10,),
                                Text('Scan Now',style:TextStyle(fontSize: 12,fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
            ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:Colors.orange
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('Scan for more:',style: Theme.of(context).textTheme.titleLarge,)),
                Expanded(
                  child: SizedBox(
                    height: 180,
                    child: Row(
                      children: [
                        Expanded(
                          flex:1,
                          child: OutlinedButton(onPressed: (){
                            showOverLay(context);
                          },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('5years',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                  SizedBox(width: 20,),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              )),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          flex: 2,
                          child:ElevatedButton(
                            onPressed: () { },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('this'),
                                SizedBox(width: 10,),
                                Text('Scan Now',style:TextStyle(fontSize: 12,fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color:Colors.orange
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Scan for more:',style: Theme.of(context).textTheme.titleLarge,)),
            Expanded(
              child: SizedBox(
                height: 180,
                child: Row(
                  children: [
                    CompositedTransformTarget(
                      link: layerLink,
                      key: actionKey,
                      child: Expanded(
                        flex:1,
                        child: OutlinedButton(onPressed: (){
                            showOverLay(context);
                        },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child:  const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('5years',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                // TextField(
                                //   key: textFieldKey,
                                //   controller: textController,
                                //   decoration: const InputDecoration(
                                //       counterText: '',
                                //       enabledBorder: OutlineInputBorder(
                                //         borderSide: BorderSide.none
                                //       ),
                                //       hintText: ' Select'
                                //   ),
                                // ),
                                SizedBox(width: 1,),
                                Icon(Icons.arrow_drop_down),
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      flex: 2,
                        child:ElevatedButton(
                          onPressed: () { },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Text('10'),
                              SizedBox(width: 10,),
                              Text('Scan Now',style:TextStyle(fontSize: 12,fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),)
                  ],
                ),
              ),
            ),
          ],
        ),
          ),

        ],
      ),
    );
  }

  Widget buildOverLay(BuildContext context)=>  TapRegion(
    onTapOutside: (PointerDownEvent event){
    },
    child: Container(
        height: overlayHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        setIsOverlayVisible(false);
                        hideOverLay();
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 18),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            border: Border( bottom: BorderSide(width: 1,color: Theme.of(context).colorScheme.outlineVariant) ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(items[index].value!.toString(),
                                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface,fontWeight: FontWeight.w400,fontSize: 16),),
                              ),
                            ],
                          )
                      ),
                    );
                  },
                ),
              ),
            ]
        )
    ),
  );

}
