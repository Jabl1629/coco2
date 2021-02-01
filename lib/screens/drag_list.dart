import 'package:flutter/material.dart';

class DragList extends StatefulWidget {
  final List<String> items;
  const DragList(List<String> certTypes, {Key key, this.items}) : super(key: key);
  @override
  _DragListState createState() => _DragListState();
}

class _DragListState extends State<DragList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReorderableListView(
        header: Text("It is most important to me that the products I buy:"),
        children: [
          for (final item in ['Are Vegan','Are Organic'])
            ListTile(
              key: ValueKey(item),
              title: Text('Item #$item')
              ),
        ],
      ),
    );
    }
  }

