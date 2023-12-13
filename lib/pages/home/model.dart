class QrCode {
  int? count;
  String? next;
  String? previous;
  List<QrMenu>? results;

  QrCode({this.count, this.next, this.previous, this.results});

  QrCode.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <QrMenu>[];
      json['results'].forEach((v) {
        results?.add(QrMenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QrMenu {
  int? id;
  String? name;
  String? barcodeImage;
  String? barcodeType;

  QrMenu({this.id, this.name, this.barcodeImage, this.barcodeType});

  QrMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    barcodeImage = json['barcode_image'];
    barcodeType = json['barcode_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['barcode_image'] = barcodeImage;
    data['barcode_type'] = barcodeType;
    return data;
  }
}
