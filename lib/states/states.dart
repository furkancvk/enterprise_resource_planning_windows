import 'package:flutter/material.dart';

class States with ChangeNotifier {
 /* int indexContent = 0;*/
  int indexSidebar = 0;
  Map<String, dynamic> currentUser = {};


  // void setIndexContent(int index) {
  //   indexContent = index;
  //   notifyListeners();
  // }

  void setIndexSidebar(int index) {
    indexSidebar = index;
    notifyListeners();
  }

  void setCurrentUser(Map<String, dynamic> user){
    currentUser = user;
    notifyListeners();
  }

}