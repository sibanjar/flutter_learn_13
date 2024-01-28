import 'package:flutter/material.dart';


class OverlayPage<T> extends StatefulWidget {
  final List<T> items;
  final Function? onChanged;
  final String? id;
  final bool isSearch;
  late InputDecoration? searchDecoration;
  final Function itemBuilder;


  OverlayPage({super.key, required this.items,this.onChanged, this.id, required this.isSearch, this.searchDecoration, required this.itemBuilder});


  @override
  State<OverlayPage<T>> createState() => _OverlayPageState();
}

class _OverlayPageState<T> extends State<OverlayPage<T>> {
  var textController = TextEditingController();
  List searchFilteredItem=[];
  late InputDecoration searchDecoration;

  @override
  void initState() {
    if(widget.searchDecoration!=null){
      searchDecoration = widget.searchDecoration!;

    }else{
      searchDecoration = InputDecoration(
        labelText: 'Search',
        contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      );
    }
  searchFilteredItem=widget.items;
    super.initState();
  }

  filter(value){
    setState(() {
      if (value.isEmpty) {
        searchFilteredItem = widget.items;
      } else {
        searchFilteredItem = widget.items.where((item) =>item.toString().toLowerCase().contains(value.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.background),
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.surface
        ),
        child: Column(
          children: [
            widget.isSearch?
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: TextField(
                controller: textController,
                onChanged: (value){
                  filter(value);
                },
                decoration: searchDecoration
              ),
            ):
            const SizedBox(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: searchFilteredItem.length,
                itemBuilder: (context, index) {

                  var item = searchFilteredItem[index];
                  return InkWell(
                    onTap: (){
                      widget.onChanged!(searchFilteredItem[index],widget.id);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background
                        ),
                        child:_itemWidgetSingleSelection(item),));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _itemWidgetSingleSelection(T item) {
      var w = widget.itemBuilder(
        context,
        item,
      );
    return w;
  }
}

