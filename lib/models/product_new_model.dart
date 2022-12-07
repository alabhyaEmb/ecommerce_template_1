import 'package:multikart/models/image_new_model.dart';

class ProductNewModel {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Categories>? categories;
  List<dynamic>? tags;
  List<ImageNewModel>? images;
  List<Attributes>? attributes;
  List<dynamic>? defaultAttributes;
  List<dynamic>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaData>? metaData;
  String? stockStatus;
  bool? hasOptions;
  Links? links;

  ProductNewModel({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.hasOptions,
    this.links,
  });

  ProductNewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    slug = json['slug'] as String?;
    permalink = json['permalink'] as String?;
    dateCreated = json['date_created'] as String?;
    dateCreatedGmt = json['date_created_gmt'] as String?;
    dateModified = json['date_modified'] as String?;
    dateModifiedGmt = json['date_modified_gmt'] as String?;
    type = json['type'] as String?;
    status = json['status'] as String?;
    featured = json['featured'] as bool?;
    catalogVisibility = json['catalog_visibility'] as String?;
    description = json['description'] as String?;
    shortDescription = json['short_description'] as String?;
    sku = json['sku'] as String?;
    price = json['price'] as String?;
    regularPrice = json['regular_price'] as String?;
    salePrice = json['sale_price'] as String?;
    dateOnSaleFrom = json['date_on_sale_from'];
    dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    dateOnSaleTo = json['date_on_sale_to'];
    dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    onSale = json['on_sale'] as bool?;
    purchasable = json['purchasable'] as bool?;
    totalSales = json['total_sales'] as int?;
    virtual = json['virtual'] as bool?;
    downloadable = json['downloadable'] as bool?;
    downloads = json['downloads'] as List?;
    downloadLimit = json['download_limit'] as int?;
    downloadExpiry = json['download_expiry'] as int?;
    externalUrl = json['external_url'] as String?;
    buttonText = json['button_text'] as String?;
    taxStatus = json['tax_status'] as String?;
    taxClass = json['tax_class'] as String?;
    manageStock = json['manage_stock'] as bool?;
    stockQuantity = json['stock_quantity'];
    backorders = json['backorders'] as String?;
    backordersAllowed = json['backorders_allowed'] as bool?;
    backordered = json['backordered'] as bool?;
    lowStockAmount = json['low_stock_amount'];
    soldIndividually = json['sold_individually'] as bool?;
    weight = json['weight'] as String?;
    dimensions = (json['dimensions'] as Map<String, dynamic>?) != null
        ? Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>)
        : null;
    shippingRequired = json['shipping_required'] as bool?;
    shippingTaxable = json['shipping_taxable'] as bool?;
    shippingClass = json['shipping_class'] as String?;
    shippingClassId = json['shipping_class_id'] as int?;
    reviewsAllowed = json['reviews_allowed'] as bool?;
    averageRating = json['average_rating'] as String?;
    ratingCount = json['rating_count'] as int?;
    upsellIds = json['upsell_ids'] as List?;
    crossSellIds = json['cross_sell_ids'] as List?;
    parentId = json['parent_id'] as int?;
    purchaseNote = json['purchase_note'] as String?;
    categories = (json['categories'] as List?)
        ?.map((dynamic e) => Categories.fromJson(e as Map<String, dynamic>))
        .toList();
    tags = json['tags'] as List?;

    images = json['images'] != null
        ? (json['images'] as List)
            .map((e) => ImageNewModel.fromJson(e))
            .toList()
        : [];
    attributes = (json['attributes'] as List?)
        ?.map((dynamic e) => Attributes.fromJson(e as Map<String, dynamic>))
        .toList();
    defaultAttributes = json['default_attributes'] as List?;
    variations = json['variations'] as List?;
    groupedProducts = json['grouped_products'] as List?;
    menuOrder = json['menu_order'] as int?;
    priceHtml = json['price_html'] as String?;
    relatedIds =
        (json['related_ids'] as List?)?.map((dynamic e) => e as int).toList();
    metaData = (json['meta_data'] as List?)
        ?.map((dynamic e) => MetaData.fromJson(e as Map<String, dynamic>))
        .toList();
    stockStatus = json['stock_status'] as String?;
    hasOptions = json['has_options'] as bool?;
    links = (json['_links'] as Map<String, dynamic>?) != null
        ? Links.fromJson(json['_links'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['slug'] = slug;
    json['permalink'] = permalink;
    json['date_created'] = dateCreated;
    json['date_created_gmt'] = dateCreatedGmt;
    json['date_modified'] = dateModified;
    json['date_modified_gmt'] = dateModifiedGmt;
    json['type'] = type;
    json['status'] = status;
    json['featured'] = featured;
    json['catalog_visibility'] = catalogVisibility;
    json['description'] = description;
    json['short_description'] = shortDescription;
    json['sku'] = sku;
    json['price'] = price;
    json['regular_price'] = regularPrice;
    json['sale_price'] = salePrice;
    json['date_on_sale_from'] = dateOnSaleFrom;
    json['date_on_sale_from_gmt'] = dateOnSaleFromGmt;
    json['date_on_sale_to'] = dateOnSaleTo;
    json['date_on_sale_to_gmt'] = dateOnSaleToGmt;
    json['on_sale'] = onSale;
    json['purchasable'] = purchasable;
    json['total_sales'] = totalSales;
    json['virtual'] = virtual;
    json['downloadable'] = downloadable;
    json['downloads'] = downloads;
    json['download_limit'] = downloadLimit;
    json['download_expiry'] = downloadExpiry;
    json['external_url'] = externalUrl;
    json['button_text'] = buttonText;
    json['tax_status'] = taxStatus;
    json['tax_class'] = taxClass;
    json['manage_stock'] = manageStock;
    json['stock_quantity'] = stockQuantity;
    json['backorders'] = backorders;
    json['backorders_allowed'] = backordersAllowed;
    json['backordered'] = backordered;
    json['low_stock_amount'] = lowStockAmount;
    json['sold_individually'] = soldIndividually;
    json['weight'] = weight;
    json['dimensions'] = dimensions?.toJson();
    json['shipping_required'] = shippingRequired;
    json['shipping_taxable'] = shippingTaxable;
    json['shipping_class'] = shippingClass;
    json['shipping_class_id'] = shippingClassId;
    json['reviews_allowed'] = reviewsAllowed;
    json['average_rating'] = averageRating;
    json['rating_count'] = ratingCount;
    json['upsell_ids'] = upsellIds;
    json['cross_sell_ids'] = crossSellIds;
    json['parent_id'] = parentId;
    json['purchase_note'] = purchaseNote;
    json['categories'] = categories?.map((e) => e.toJson()).toList();
    json['tags'] = tags;
    json['images'] = images;
    json['attributes'] = attributes?.map((e) => e.toJson()).toList();
    json['default_attributes'] = defaultAttributes;
    json['variations'] = variations;
    json['grouped_products'] = groupedProducts;
    json['menu_order'] = menuOrder;
    json['price_html'] = priceHtml;
    json['related_ids'] = relatedIds;
    json['meta_data'] = metaData?.map((e) => e.toJson()).toList();
    json['stock_status'] = stockStatus;
    json['has_options'] = hasOptions;
    json['_links'] = links?.toJson();
    return json;
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  Dimensions.fromJson(Map<String, dynamic> json) {
    length = json['length'] as String?;
    width = json['width'] as String?;
    height = json['height'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['length'] = length;
    json['width'] = width;
    json['height'] = height;
    return json;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;

  Categories({
    this.id,
    this.name,
    this.slug,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    slug = json['slug'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['slug'] = slug;
    return json;
  }
}

class Attributes {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attributes({
    this.id,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    position = json['position'] as int?;
    visible = json['visible'] as bool?;
    variation = json['variation'] as bool?;
    options =
        (json['options'] as List?)?.map((dynamic e) => e as String).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['position'] = position;
    json['visible'] = visible;
    json['variation'] = variation;
    json['options'] = options;
    return json;
  }
}

class MetaData {
  int? id;
  String? key;
  String? value;

  MetaData({
    this.id,
    this.key,
    this.value,
  });

  MetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    key = json['key'] as String?;
    value = json['value'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['key'] = key;
    json['value'] = value;
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
