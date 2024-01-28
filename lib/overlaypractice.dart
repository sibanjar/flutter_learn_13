import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  final ScrollController scrollController;
  const TestWidget({super.key, required this.scrollController});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final focusNode = FocusNode();
  final layerLink = LayerLink();
  final myWidgetKey = GlobalKey();
  Offset offset = Offset(0,0);

  List<String> categories = ['option1','option2','option3','option4','option5','option1','option2','option3','option4','option5','option1','option2','option3','option4','option5'];
  OverlayEntry? entry;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1),(){
      widget.scrollController.addListener(() {
        RenderBox renderbox = myWidgetKey.currentContext!.findRenderObject() as RenderBox;
        Offset position = renderbox.localToGlobal(Offset.zero);
        double screenHeight = MediaQuery.of(context).size.height;
        double x = position.dx;
        double y = position.dy;
        // setState(() {
        offset = Offset(x,y);
        // });
        entry?.markNeedsBuild();
      });
    });

    // WidgetsBinding.instance.addPostFrameCallback((_)=>showOverLay());
    super.initState();

    focusNode.addListener(() {
      if(focusNode.hasFocus){
        showOverLay();
      }else{
        //may not needed
        hideOverLay();
      }
    });
  }

  void showOverLay(){
    OverlayState overlayState = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final screenHeight = MediaQuery.of(context).size.height;
    // final offset = renderBox.localToGlobal(Offset.zero);

    final topSpace = size.height + 8; // Space below TextField
    final bottomSpace = -size.height - 150; // Space above TextField

    final maxBottomDisplay = screenHeight-200; //overlay height is 200
    final currentPosition = offset.dy;

    bool isBottomTouched = currentPosition>=maxBottomDisplay;

    entry = OverlayEntry(
        builder: (context)=>
            Positioned(
              top: offset.dy,
              left: offset.dx,
              width: size.width,
              // child: CompositedTransformFollower(
              //     link: layerLink,
              //     showWhenUnlinked: false,
              //     offset: Offset(0,isBottomTouched?bottomSpace:topSpace),
              //     child: buildOverLay()
              // )
              child : buildOverLay(),
            ));

    overlayState.insert(entry!);

  }

  void hideOverLay(){
    entry?.remove();
    entry=null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: myWidgetKey,
      controller: textController,
      focusNode: focusNode,
      decoration: InputDecoration(
          label: const Text('username'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )
      ),
    );
    // return CompositedTransformTarget(
    //   link: layerLink,
    //   child: TextField(
    //     key: myWidgetKey,
    //     controller: textController,
    //     focusNode: focusNode,
    //     decoration: InputDecoration(
    //         label: const Text('username'),
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(5),
    //         )
    //     ),
    //   ),
    // );
  }

  Widget buildOverLay()=>Container(
    color:Colors.black54,
    height: 200,
    child: ListView.builder(
        controller: widget.scrollController,
        itemCount: categories.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: ()
            {
              textController.text = categories[index];
              focusNode.unfocus();
              hideOverLay();
            },
            child : Text(categories[index],
              style: Theme.of(context).textTheme.titleLarge,
              // style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.orange),
            ),
          );
        }),
  );

}
// setState(() {
//   if(y<300){ isTop = false; }
//   else if(y>300){ isTop = true; }
// });


//tapregion to check tap inside and outside button or textfield

// TapRegion(
// onTapOutside: (_)=>print('outsude'),
// onTapInside: (_)=>print('inside'),
// child: ElevatedButton(
// onPressed: (){
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => const CatAnimation()),
// );
// }, child: const Text("Cat Animation"),
// ),
// )
// ,

