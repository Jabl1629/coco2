import 'package:flutter/material.dart';
import 'package:coco2/screens/top_app_bar.dart';
import 'package:coco2/screens/nav_bar.dart';
import 'package:coco2/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coco2/screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coco2/models/category.dart';

class CategoryView extends StatefulWidget {
  static const id = 'category_view';

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      User user = _auth.currentUser;
      if (user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e){
      print(e);
    }
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
    print("successful logout boiiii");
  }

  List <Category> categories = [
    Category('Clothing and Apparel', "assets/icons/Shirt.png"),
    Category('Footware', "assets/icons/Shoe.png"),
    Category('Cosmetics and Personal Care', "assets/icons/Lotion.png"),
    Category('Accessories', "assets/icons/Belt.png")];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(leftIcon: kBackIcon, title: "Category View", rightIcon: kBackIcon),
      bottomNavigationBar: NavBar(startIndex: 1),
      body: Container(
        child: Column(
          children: [
            SizedBox(height:30),
            Text("Explore fits by category",
                textAlign: TextAlign.center,
                style:GoogleFonts.montserrat(
                    textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black87,fontStyle: FontStyle.italic))),
            SizedBox(height:20),
            Container(
              height:500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:14.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 4),
          // Generate 100 widgets that display their index in the List.
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration:BoxDecoration(
                        border: Border.all(color: Colors.green,width: 2),),
                      child: MaterialButton(
                        onPressed: () {
                          },
                        minWidth: 200.0,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(categories[index].iconLoc,height: 60),
                            SizedBox(height:10),
                            Text(
                              categories[index].title,textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                    ),
                  ),
              ),
              ],
        ),
        ),
        );
  }
}