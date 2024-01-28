
// 3rd file, show_overlay.dart ------------
import 'package:flutter/material.dart';

import 'overlay_page.dart';

Future showOverlay<T>({
  required BuildContext context,
  required RelativeRect position,
  required Offset verticalPosition,
  required List<T> items,
  Function? onChanged,
  String? id,
  required bool isSearch,
  InputDecoration? searchDecoration,
  required Function itemBuilder,


}) {
  final NavigatorState navigator = Navigator.of(context);
  return navigator.push(
    _OverlayRoute<T>(
      id:id,
      verticalPosition:verticalPosition,
      position: position,
      items:items,
      onChanged: onChanged,
      isSearch: isSearch,
      searchDecoration: searchDecoration,
      itemBuilder: itemBuilder
    ),
  );
}

// Positioning of the menu on the screen.
class _OverlayRouteLayout extends SingleChildLayoutDelegate {
// Rectangle of underlying button, relative to the overlay's dimensions.
  final RelativeRect position;
  final BuildContext context;
  final  Offset verticalPosition;

  _OverlayRouteLayout(this.context, this.position,  this.verticalPosition, );

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final parentRenderBox = context.findRenderObject() as RenderBox;
//keyBoardHeight is height of keyboard if showing
    double keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    double safeAreaTop = MediaQuery.of(context).padding.top;
    double safeAreaBottom = MediaQuery.of(context).padding.bottom;
    double totalSafeArea = safeAreaTop + safeAreaBottom;
    double maxHeight = constraints.minHeight - keyBoardHeight - totalSafeArea;
    return BoxConstraints.loose(
      Size(parentRenderBox.size.width - position.right - position.left, maxHeight,),
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    double x = verticalPosition.dx;
    double y = position.top;
    double appbarHeight = View.of(context).padding.top+15;
    double remainingHeight = size.height - verticalPosition.dy;
    //height from top_position of button to bottom of screenHeight
    //vp is height from top of screen to top_position of button. button is child in showOverlay

// check if we are in the bottom
    if (y + childSize.height > size.height - keyBoardHeight) {
      y = size.height - childSize.height - keyBoardHeight;
    }
    //check if height is enough
    if(size.height<= childSize.height){
      return Offset(x, y);
    }

    if(verticalPosition.dy+childSize.height > size.height){
      y = size.height- childSize.height-remainingHeight;
      if(y + childSize.height > size.height - keyBoardHeight){
        y-=keyBoardHeight;
      }
      // x=verticalPosition.dx;
    }

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_OverlayRouteLayout oldDelegate) {
    return true;
  }
}

class _OverlayRoute<T> extends PopupRoute {
  final RelativeRect position;
  final  Offset verticalPosition;
  final List<T> items;
  final Function? onChanged;
  final String? id;
  final bool isSearch;
  final InputDecoration? searchDecoration;
  final Function itemBuilder;



  _OverlayRoute({this.id,required this.position, required this.verticalPosition, required this.items, this.onChanged,required this.isSearch, this.searchDecoration,required this.itemBuilder});

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {

    return CustomSingleChildLayout(
      delegate: _OverlayRouteLayout(context, position,verticalPosition),
      child: SizedBox(
        height: 200,
        child: OverlayPage(items: items,onChanged: onChanged,id: id, isSearch: isSearch,searchDecoration: searchDecoration, itemBuilder: itemBuilder,)
      ),
    );
  }

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => '';

  @override
  Duration get transitionDuration => Duration.zero;
}

