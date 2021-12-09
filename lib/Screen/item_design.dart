import 'package:all_about_api/Constant/constant.dart';
import 'package:all_about_api/Model/easyschool_model.dart';
import 'package:all_about_api/Screen/item_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDesign extends StatelessWidget {
  final int index;

  late List<LstAlbumDetail> listData;

  ItemDesign({required this.listData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetails(
                        albumName: listData[index].AlbumName,
                        imageName: listData[index].ImageName,
                        imageSource: listData[index].ImageSource,
                        fileType: listData[index].FileType,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                    height: 50,
                    child: Text(listData[index].ImageName,
                        style: Constant.kTextStyle()))),
          ],
        ),
      ),
    );
  }
}
