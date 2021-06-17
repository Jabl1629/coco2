import 'package:firebase_auth/firebase_auth.dart';


class UserFuncs{
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  Future getCurrentUser() async {
    try {
      User user = _auth.currentUser;
      if (user != null){
        loggedInUser = user;
        print(loggedInUser.email);
        return loggedInUser;
      }
    } catch (e){
      print(e);
    }
  }
}