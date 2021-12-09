import 'dart:convert';

import 'package:all_about_api/DatabaseHelper/easyschool_dbhelper.dart';
import 'package:all_about_api/Model/easyschool_model.dart';
import 'package:all_about_api/NetworkHelper/easyschool_post_api.dart';
import 'package:all_about_api/Screen/listdata_screen.dart';
import 'package:all_about_api/utils/connectivity_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageState extends ChangeNotifier {
  late List<LstAlbumDetail> detailsList;
  late List<EasySchoolModel> easySchoolModelList;
  late String stringValue;
  late Map<String, dynamic> mapValue;
  late List<Map<String, dynamic>> listOfMap = [];
  late bool fetching;
  HomePageState() {
    detailsList = [];
    easySchoolModelList = [];
    fetching = false;
  }
  //method to create Database in Sqlite
  init() async {
    await EasySchoolDBHelper.instance.db;
  }

  //it will check internet connection
  CheckConnection(context) async {
    ConnectivityCheck.check().then((value) {
      if (value) {
        //
        getApi().whenComplete(() {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) {
              return ListDataScreen(listData: detailsList);
            },
          ));
        });
        notifyListeners();
      } else {
        //
        getDataFromDataBase().whenComplete(() {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) {
              return ListDataScreen(listData: detailsList);
            },
          ));
        });
      }
    });

    notifyListeners();
  }

//fetch api data to list
  Future getApi() async {
    debugPrint("1");
    detailsList.clear();
    listOfMap.clear();
    easySchoolModelList.clear();
    easySchoolModelList = await EasySchool.postApiCall();
    easySchoolModelList.forEach((element) {
      if (element.STATUS_CODE == '0') {
        detailsList = element.lstAlbumDetail;
        detailsList.forEach((element) {
          stringValue = jsonEncode(element);
          mapValue = jsonDecode(stringValue);
          listOfMap.add(mapValue);
        });
        //
        insertDataIntoDatabase();
        fetching = false;
        print("on net");
        notifyListeners();
      } else {
        fetching = false;
        print(element.MESSAGE);
        notifyListeners();
      }
    });
    notifyListeners();
  }

//it will insert data into database
  insertDataIntoDatabase() async {
    debugPrint("5");
    deleteDataBase();
    listOfMap.forEach((element) {
      EasySchoolDBHelper.instance.insertData(element);
    });
    fetching = false;
    notifyListeners();
  }

//it will get data from Database
  Future getDataFromDataBase() async {
    await EasySchoolDBHelper.instance.getData().then((value) {
      detailsList = value;
    });
    print("on sqlite");
    fetching = false;
    notifyListeners();
  }

//it will delete Data table form Database
  deleteDataBase() async {
    await EasySchoolDBHelper.instance.deleteAllDataFromEasySchoolDb();
    notifyListeners();
  }
}
