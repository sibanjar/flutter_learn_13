import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

class TextFormWidget3 extends StatefulWidget {
  const TextFormWidget3({super.key});

  @override
  State<TextFormWidget3> createState() => _TextFormWidget3State();
}

class _TextFormWidget3State extends State<TextFormWidget3> {
  final layerLink = LayerLink();
  List<String> categories = ['option1','option2','option3','option4','option5','option1','option2','option3','option4','option5','option1','option2','option3','option4','option5'];
  OverlayEntry? entry;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // WidgetsBinding.instance?.addPostFrameCallback((_)=>showOverLay());
    super.initState();

  }

  void showOverLay(){
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    double x = position.dx;
    double y = position.dy;


    entry = OverlayEntry(
        builder: (context)=>
            Positioned(
                width: size.width,
                child: CompositedTransformFollower(
                    link: layerLink,
                    showWhenUnlinked: false,
                    targetAnchor:  Alignment.topLeft,
                    followerAnchor:  Alignment.bottomLeft,
                    child: buildOverLay(size.width))
            ));
    overlay.insert(entry!);


  }

  void hideOverLay(){
    entry?.remove();
    entry=null;
  }

  void setNewList() {
    List<String> categories1 = ['1','2','3','4','5','1','2','3','4','5','1','2','3','4','5'];

    setState(() {
      categories = categories1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: layerLink,
        child: TextField(
          onTap: (){ showOverLay(); },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
              hintText: 'username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none
              ),
              hintStyle: Theme.of(context).textTheme.labelLarge,
              fillColor: Theme.of(context).colorScheme.surfaceVariant,
              filled: true,
          ),
        ),
    );
  }

  Widget buildOverLay(double width)=>  TapRegion(
    onTapOutside: (_){
      hideOverLay();
    },
    child: Container(
      height: 240,
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height:40,
                  width:width-16,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount : categories.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          setNewList();
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(width: 1)
                              ),
                              child: Text(categories[index],style: Theme.of(context).textTheme.labelMedium),
                            ),
                            const SizedBox(width: 8,)
                          ],
                        ),
                      );
                    }

                  ),
                ),
              ),

            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outlineVariant,
              border: Border(bottom: BorderSide(
                width: 1 ,color: Theme.of(context).colorScheme.outlineVariant
              ))
            ),
              child: Text('Suggested question for Relationship',style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700) ,)),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: categories.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: ()
                    {
                      textController.text = categories[index];
                      hideOverLay();
                    },
                    child : Text(categories[index],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                }),
          ),
        ],
      ),
    ),
  );




}
