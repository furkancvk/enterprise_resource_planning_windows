import 'package:flutter/material.dart';

class States with ChangeNotifier {
  int indexTabBar = 0;
  int indexSidebar = 0;
  Map<String, dynamic> currentUser = {};

  void setIndexTabBar(int index) {
    indexTabBar = index;
    notifyListeners();
  }

  void setIndexSidebar(int index) {
    indexSidebar = index;
    notifyListeners();
  }

  void setCurrentUser(Map<String, dynamic> user) {
    currentUser = user;
    notifyListeners();
  }
}
