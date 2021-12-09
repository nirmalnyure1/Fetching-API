import 'package:all_about_api/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  String albumName;
  String imageName;
  String imageSource;
  String fileType;
  ItemDetails({
    required this.albumName,
    required this.imageName,
    required this.imageSource,
    required this.fileType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(albumName, style: Constant.kTextStyle()),
          Divider(),
          Text(imageName, style: Constant.kTextStyle()),
          Divider(),
          Text(albumName, style: Constant.kTextStyle()),
          Divider(),
          Text(imageSource, style: Constant.kTextStyle()),
          Divider(),
          Text(fileType, style: Constant.kTextStyle()),
          Divider(),
        ],
      ),
    );
  }
}
