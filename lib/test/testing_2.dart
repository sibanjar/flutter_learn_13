import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({Key? key}) : super(key: key);

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  final ValueNotifier _selectedItemsNotifier = ValueNotifier([]);
  final layerLink = LayerLink();
  OverlayEntry? entry;
  late TextEditingController textController;
  late FocusNode _overlayFocusNode;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    _overlayFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textController.dispose();
    _overlayFocusNode.dispose();
    super.dispose();
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    double x = position.dx;
    double y = position.dy;
    double screenHeight = MediaQuery.of(context).size.height;
    Offset offset = Offset(0, size.height);
    bool isBottom = true;
    if (y + 200 > screenHeight) {
      isBottom = false;
    }

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          targetAnchor: isBottom ? Alignment.bottomLeft : Alignment.topLeft,
          followerAnchor: isBottom ? Alignment.topLeft : Alignment.bottomLeft,
          child: buildOverlay(),
        ),
      ),
    );
    overlay!.insert(entry!);
  }

  void _hideOverlay() {
    entry?.remove();
    entry = null;
  }

  void _handleFocus(bool isFocused) {
    if (isFocused && entry == null) {
      _showOverlay();
    } else if (!isFocused && entry != null) {
      _hideOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: ElevatedButton(
        onPressed: () {
          _handleFocus(true);
        },
        child: const Text('Category'),
      ),
    );
  }

  Widget buildOverlay() => ValueListenableBuilder(
          valueListenable: _selectedItemsNotifier,
          builder: (context, data, wt) {
            return Container(
              color: Colors.orange,
              height: 200,
              child: Column(
                children: [
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        focusNode: _overlayFocusNode,
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Search items',
                          hintStyle: Theme.of(context).textTheme.headline6,
                          fillColor: Theme.of(context).colorScheme.background,
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 20,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            textController.text = categories[index];
                            _hideOverlay();
                          },
                          child: Text(
                            categories[index],
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

            );}
      );

  final List<String> categories = [
    'option1',
    'option2',
    'option3',
    'option4',
    'option5'
  ];
}
