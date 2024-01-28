import 'package:flutter/material.dart';

class OverlayWidget extends StatefulWidget {
  final bool? isTop;
  final ScrollController? scrollController;
  final Widget followerWidget;
  final Widget targetWidget;
  const OverlayWidget({super.key, this.isTop=true , required this.followerWidget, required this.targetWidget,  this.scrollController});

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  final layerLink = LayerLink();
  OverlayEntry? entry;
  bool isTop = true;
  bool isTap = false;
  Key myWidgetKey = GlobalKey();
  TextEditingController textController = TextEditingController();


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1),(){
      widget.scrollController!.addListener(() {
        // RenderBox renderBox = myWidgetKey.currentContext!.findRenderObject() as RenderBox;
        final renderBox = context.findRenderObject() as RenderBox;
        Offset position = renderBox.localToGlobal(Offset.zero);
        double screenHeight = MediaQuery.of(context).size.height;
        Size size = renderBox.size;
        double x = position.dx;
        double y = position.dy;
        double overlayHeight = 200;
        double appBarHeight = MediaQuery.of(context).padding.top+AppBar().preferredSize.height;


        if((y+size.height+overlayHeight)>screenHeight){ isTop = true;}

        if(appBarHeight>(y-overlayHeight)){ isTop =false; }

        entry?.markNeedsBuild();
      });
    });
    super.initState();
  }


  void showOverLay(){
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);
    double appBarHeight = MediaQuery.of(context).padding.top+AppBar().preferredSize.height;
    final size = renderBox.size;
    double overlayHeight = 200;
    double x = position.dx;
    double y = position.dy;
    double screenHeight = MediaQuery.of(context).size.height;
    if(widget.isTop!=null){isTop = widget.isTop!;}


    if((y+size.height)>screenHeight){ hideOverLay(); }

    if(appBarHeight>(y-overlayHeight)) { isTop = false ;}


    entry = OverlayEntry(
        builder: (context)=>
            Positioned(
                width: size.width,
                child: CompositedTransformFollower(
                    link: layerLink,
                    showWhenUnlinked: false,
                    targetAnchor: isTop? Alignment.topLeft:Alignment.bottomLeft,
                    followerAnchor: isTop? Alignment.bottomLeft : Alignment.topLeft,
                    child: buildOverLay())
            ));
    overlay.insert(entry!);

  }

  void hideOverLay(){
    entry?.remove();
    entry=null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      // child:TextField(
      //   onTap: showOverLay,
      //   key: myWidgetKey,
      //   controller: textController,
      //   decoration: InputDecoration(
      //       label: const Text('username'),
      //       border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(5),
      //       )
      //   ),
      // ),
      child: ElevatedButton(
        onPressed: (){
          isTap = !isTap;
          isTap?showOverLay():hideOverLay();
        },
        child: const Text('Categoryyyyy'),
      ),
    );
  }

  Widget buildOverLay()=> widget.followerWidget ;


}

