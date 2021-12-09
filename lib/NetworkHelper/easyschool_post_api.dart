import 'dart:convert';

import 'package:all_about_api/Model/easyschool_model.dart';
import 'package:http/http.dart' as http;

class EasySchool {
  static late Map jsonData;
  static late List apiData;

  static postApiCall() async {
    List<EasySchoolModel> essentialData = [];
    List<LstAlbumDetail> listAccount = [];
    var body = jsonEncode({
      "SchID": "PS0011",
      "AlbumID": "238",
      "AlbumType": "STUDYMATERIAL",
    });
    var header = {'Content-Type': 'application/json; charset=UTF-8'};
    http.Response response = await http.post(
        Uri.parse(
            "https://esnep.com/EasySchoolKhaltiApi/api/User/getGalleryImage"),
        body: body,
        headers: header);

    jsonData = jsonDecode(response.body);
    apiData = jsonData["LstAlbumDetail"];
    //print(apiData);
    essentialData.clear();
    listAccount.clear();
    essentialData.add(
      EasySchoolModel(
        lstAlbumDetail: listAccount,
        STATUS_CODE: jsonData["STATUS_CODE"],
        MESSAGE: jsonData["MESSAGE"],
      ),
    );

    for (int i = 0; i < apiData.length; i++) {
      listAccount.add(LstAlbumDetail(
        ImageSource: apiData[i]["ImageSource"],
        FileType: apiData[i]["FileType"],
        AlbumName: apiData[i]["AlbumName"],
        ImageName: apiData[i]["ImageName"],
        AlbumID: apiData[i]["AlbumID"].toString(),
        ImgID: apiData[i]["ImgID"].toString(),
      ));
    }

    return essentialData;
  }
}
