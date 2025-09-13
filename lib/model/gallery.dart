class Gallery {
  String? collectionId;
  String? collectionName;
  String? id;
  String? image;
  String? productid;

  Gallery(
    this.collectionId,
    this.collectionName,
    this.id,
    this.image,
    this.productid,
  );

  factory Gallery.fromJson(Map<String, dynamic> jsonObject) {
    return Gallery(
      jsonObject['collectionId'],
      jsonObject['collectionName'],
      jsonObject['id'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
      jsonObject['productid'],
    );
  }
}
