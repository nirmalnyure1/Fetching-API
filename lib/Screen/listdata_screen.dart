import 'package:all_about_api/Model/easyschool_model.dart';
import 'package:all_about_api/Screen/item_design.dart';
import 'package:flutter/material.dart';

class ListDataScreen extends StatefulWidget {
  late List<LstAlbumDetail> listData;
  ListDataScreen({required this.listData});

  @override
  State<ListDataScreen> createState() => _ListDataScreenState();
}

class _ListDataScreenState extends State<ListDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: widget.listData.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemDesign(
              listData: widget.listData,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
