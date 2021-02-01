import 'package:flutter/material.dart' ;
import 'package:coco2/constants.dart';
import 'package:coco2/screens/top_app_bar.dart';
import 'package:coco2/screens/drag_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coco2/quick_reorder_list.dart';

class PrefScreen extends StatefulWidget {


  @override
  _PrefScreenState createState() => _PrefScreenState();
}
class _PrefScreenState extends State<PrefScreen> {
  final _firestore = FirebaseFirestore.instance;
  List<String> items = [
  'Are Organic',
  'Are Vegan',
  'Are made with recycled materials',
  'Are "Fair Trade" Certified',
  'Are Animal Cruelty Free',
  'Are certified non-toxic',
  'Donate a portion of proceeds to developing communities',
  'Offset CO2 emissions through carbon credits',
  'Commit to a year over year reduction in C02 emissions'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(leftIcon: kBackIcon, title: "Coco Home", rightIcon: kSearchIcon),
      body: Container(
        child: SafeArea(
         child: Column(
           children: [
             SizedBox(height: 20),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: QuickReorderableListView(
                  onReorder: (oldIndex, newIndex){
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                        ;
                      }
                      final item = items.removeAt(oldIndex);
                      items.insert(newIndex, item);
                      }
                      );
                  },
                  header: Column(
                    children: [
                      Text(
                          "It is most important to me that products I buy:",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green)),
                      SizedBox(height:8),
                      Divider(height:1,thickness:2,color:Colors.green),
                      SizedBox(height:8),
                      Text("Most Important"),
                      SizedBox(height:5)
                    ],
                  ),
                  children: [
                    for (final item in items)
                      Card(
                        key: ValueKey(item),
                        child: ListTile(
                          title: Text(
                              item,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold) ),
                          tileColor: Colors.green.shade100,
                          enabled: true,
                          selectedTileColor: Colors.grey,
                          leading: Icon(Icons.nature_people)
                    ),
                      )
                  ],
        ),


               ),
             ),
           Text("Least Important")
           ],
         ),
      ),
      ),
    );
  }
}