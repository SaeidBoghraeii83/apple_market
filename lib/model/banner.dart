class Baner {
  String? categoryId;
  String? collectionId;
  String? id;
  String? thumbnail;

  Baner(this.categoryId, this.collectionId, this.id, this.thumbnail);

  factory Baner.formMapJson(Map<String, dynamic> jsonObject) {
    return Baner(
      jsonObject['categoryId'],
      jsonObject['collectionId'],
      jsonObject['id'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}', // گرفتن بنر از سرور
    );
  }
}
