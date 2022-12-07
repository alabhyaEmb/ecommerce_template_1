class ImageNewModel {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  ImageNewModel({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  ImageNewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    dateCreated = json['date_created'] as String?;
    dateCreatedGmt = json['date_created_gmt'] as String?;
    dateModified = json['date_modified'] as String?;
    dateModifiedGmt = json['date_modified_gmt'] as String?;
    src = json['src'] as String?;
    name = json['name'] as String?;
    alt = json['alt'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['date_created'] = dateCreated;
    json['date_created_gmt'] = dateCreatedGmt;
    json['date_modified'] = dateModified;
    json['date_modified_gmt'] = dateModifiedGmt;
    json['src'] = src;
    json['name'] = name;
    json['alt'] = alt;
    return json;
  }
}
