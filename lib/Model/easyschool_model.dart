class EasySchoolModel {
  EasySchoolModel({
    required this.lstAlbumDetail,
    required this.STATUS_CODE,
    required this.MESSAGE,
  });
  late final List<LstAlbumDetail> lstAlbumDetail;
  late final String STATUS_CODE;
  late final String MESSAGE;

  EasySchoolModel.fromJson(Map<String, dynamic> json) {
    lstAlbumDetail = List.from(json['LstAlbumDetail'])
        .map((e) => LstAlbumDetail.fromJson(e))
        .toList();
    STATUS_CODE = json['STATUS_CODE'];
    MESSAGE = json['MESSAGE'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['LstAlbumDetail'] = lstAlbumDetail.map((e) => e.toJson()).toList();
    _data['STATUS_CODE'] = STATUS_CODE;
    _data['MESSAGE'] = MESSAGE;
    return _data;
  }
}

class LstAlbumDetail {
  LstAlbumDetail({
    required this.ImgID,
    required this.AlbumID,
    required this.AlbumName,
    required this.ImageName,
    required this.ImageSource,
    required this.FileType,
  });

  late final String ImgID;
  late final String AlbumID;
  late final String AlbumName;
  late final String ImageName;
  late final String ImageSource;
  late final String FileType;

  LstAlbumDetail.fromJson(Map<String, dynamic> json) {
    ImgID = json['ImgID'];
    AlbumID = json['AlbumID'];
    AlbumName = json['AlbumName'];
    ImageName = json['ImageName'];
    ImageSource = json['ImageSource'];
    FileType = json['FileType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['ImgID'] = ImgID;
    _data['AlbumID'] = AlbumID;
    _data['AlbumName'] = AlbumName;
    _data['ImageName'] = ImageName;
    _data['ImageSource'] = ImageSource;
    _data['FileType'] = FileType;
    return _data;
  }
}
