import 'package:flutter/material.dart';

class States with ChangeNotifier {
  int indexTabBar = 0;
  int indexSidebar = 0;
  int indexContent = 0;
  Map<String, dynamic> currentUser = {};

  int employeeIndexRow = 0;

  List<int> processSelectedRows = [];

  List<int> materialSelectedRows = [];

  List<int> employeeSelectedRows = [];

  void setIndexTabBar(int index) {
    indexTabBar = index;
    notifyListeners();
  }

  void setIndexSidebar(int index) {
    indexSidebar = index;
    notifyListeners();
  }

  void setIndexContent(int index) {
    indexContent = index;
    notifyListeners();
  }

  void setCurrentUser(Map<String, dynamic> user) {
    currentUser = user;
    notifyListeners();
  }

  void setEmployeeIndexRow(int index) {
    employeeIndexRow = index;
    notifyListeners();
  }

  void setProcessSelectedRows(int index) {
    if(processSelectedRows.contains(index)) {
      processSelectedRows.removeAt(processSelectedRows.indexOf(index));
    } else {
      processSelectedRows.add(index);
    }
    notifyListeners();
  }

  void setMaterialSelectedRows(int index) {
    if(materialSelectedRows.contains(index)) {
      materialSelectedRows.removeAt(materialSelectedRows.indexOf(index));
    } else {
      materialSelectedRows.add(index);
    }
    notifyListeners();
  }

  void setEmployeeSelectedRows(int index) {
    if(employeeSelectedRows.contains(index)) {
      employeeSelectedRows.removeAt(employeeSelectedRows.indexOf(index));
    } else {
      employeeSelectedRows.add(index);
    }
    notifyListeners();
  }

}
