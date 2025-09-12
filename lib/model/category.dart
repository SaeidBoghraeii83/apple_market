class Category {
  String? collectionId;
  String? collectionName;
  String? color;
  String? icon;
  String? id;
  String? thumbnail;
  String? title;

  Category(
    this.collectionId,
    this.collectionName,
    this.color,
    this.icon,
    this.id,
    this.thumbnail,
    this.title,
  );

  factory Category.formMapJson(Map<String, dynamic> jsonObject) {
    return Category(
      jsonObject['collectionId'],
      jsonObject['collectionName'],
      jsonObject['color'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}', // گرفتن بنر از سرور
      jsonObject['id'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}', // گرفتن بنر از سرور
      jsonObject['title'],
    );
  }
}
