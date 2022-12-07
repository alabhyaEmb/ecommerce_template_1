import 'package:multikart/models/image_new_model.dart';

class CategoryNewModel {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  ImageNewModel? image;
  int? menuOrder;
  int? count;
  Links? links;

  CategoryNewModel({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.links,
  });

  CategoryNewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    slug = json['slug'] as String?;
    parent = json['parent'] as int?;
    description = json['description'] as String?;
    display = json['display'] as String?;
    image = json['image'] != null
        ? ImageNewModel.fromJson(json['image'])
        : ImageNewModel();
    menuOrder = json['menu_order'] as int?;
    count = json['count'] as int?;
    links = (json['_links'] as Map<String, dynamic>?) != null
        ? Links.fromJson(json['_links'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['slug'] = slug;
    json['parent'] = parent;
    json['description'] = description;
    json['display'] = display;
    json['image'] = image;
    json['menu_order'] = menuOrder;
    json['count'] = count;
    json['_links'] = links?.toJson();
    return json;
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;

  Links({
    this.self,
    this.collection,
  });

  Links.fromJson(Map<String, dynamic> json) {
    self = (json['self'] as List?)
        ?.map((dynamic e) => Self.fromJson(e as Map<String, dynamic>))
        .toList();
    collection = (json['collection'] as List?)
        ?.map((dynamic e) => Collection.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['self'] = self?.map((e) => e.toJson()).toList();
    json['collection'] = collection?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Self {
  String? href;

  Self({
    this.href,
  });

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['href'] = href;
    return json;
  }
}

class Collection {
  String? href;

  Collection({
    this.href,
  });

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['href'] = href;
    return json;
  }
}
