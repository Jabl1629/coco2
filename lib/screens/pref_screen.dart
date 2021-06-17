import 'package:flutter/material.dart' ;
import 'package:coco2/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coco2/quick_reorder_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coco2/models/pref.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coco2/screens/splash_screen.dart';
import 'package:coco2/screens/top_fits.dart';

class PrefScreen extends StatefulWidget {
  static const id = 'pref_screen';

  @override
  _PrefScreenState createState() => _PrefScreenState();
}
class _PrefScreenState extends State<PrefScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser ;

  List<Pref> items = [
    Pref('Are Organic', kOrganic,0),
    Pref('Are Vegan', kVegan,1),
    Pref('Are made with recycled materials', kRecycled,2),
    Pref('Are animal cruelty free', kAnimalCruelty,3),
    Pref('Are certified non-toxic', kNonToxic,4),
    Pref('Donate a portion of proceeds', kPercentage,5),
    Pref('Offset CO2 emissions through carbon credits', kCarbonNeutral,6),
    Pref('Reduce CO2 emissions year over year', kCarbonReduction,7),
    Pref('Are fair trade certified', kFairTrade ,8)
  ];

  var cardIndex = 0;

  var certIndex = Iterable<int>.generate(9).toList();

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser;
      if (user!= null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 90,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:40,right:40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "When selecting products, it is most important that they:",
                      textAlign: TextAlign.center,
                      style:GoogleFonts.montserrat(
                          textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic))
                  ),
                ],
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: SafeArea(
         child: Column(
           children: [
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: QuickReorderableListView(
                  onReorder: (oldIndex, newIndex){
                    setState(() {
                      print(certIndex);
                      cardIndex = 0;

                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final item = items.removeAt(oldIndex);
                      items.insert(newIndex, item);
                      final cert = certIndex.removeAt(oldIndex);
                      certIndex.insert(newIndex, cert);
                    });
                  },
                  children: [
                    for (final item in items)
                      Card(
                        key: ValueKey(item),
                        child: ListTile(
                          title: Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold) ),
                          tileColor: Colors.white30,
                          enabled: true,
                          selectedTileColor: Colors.grey,
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(child: Image.asset(item.prefIcon),height: 40),
                            ],
                          ),
                          leading: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("#"+ (cardIndex += 1).toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                            ],
                            ),
                          ),
                      ),
                  ],
        ),
               ),
             ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Material(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () {
                  _firestore.collection('certPrefs').add({
                    'initPrefs': certIndex,
                    'user': loggedInUser.email
                  });
                  Navigator.pushNamed(context, "0");
                  Navigator.pushNamed(context, SplashScreen.id);
                  print(certIndex);
                },
                minWidth: 200.0,
                height: 42.0,
                child:Text('Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
              ),
            ),
          ),
             ],),
           ),
         ),
      );
  }
}