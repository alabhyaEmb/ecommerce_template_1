import 'package:multikart/models/product_new_model.dart';
import 'package:multikart/services/api_service.dart';

import '../../config.dart';

class ProductDetailController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController controller = TextEditingController();
  ProductNewModel? productNewModel;
  int quantity = 1;
  Product product = Product();
  List<Images> imagesList = [];
  List<ProductNewModel>? similarProductList = [];
  int current = 0;
  List reviewList = [];
  int currentLast = 0;
  bool isNotData = false;
  int selectedColor = 0;
  int selectedSize = 0;
  bool isCartPage = false;
  final CarouselController sliderController = CarouselController();
  List<HomeFindStyleCategoryModel> similarList = [];
  int colorSelected = 1;
  ApiService apiService = ApiService();

  @override
  void onReady() async {
    product = productList;
    similarProductList = await apiService.getSimilarProducts(
        categoryIds: productNewModel!.relatedIds!);
    print(similarProductList);
    similarList = AppArray().similarProductList;
    for (var i = 0; i < product.images!.length; i++) {
      if (colorSelected == product.images![i].colorId) {
        imagesList.add(product.images![i]);
      }
    }
    update();
    super.onReady();
  }

  //on quantity increase
  quantityIncrease() {
    int val = quantity;
    val++;
    quantity = val;
    update();
  }

  //on quantity decrease
  quantityDecrease() {
    int val = quantity;
    val--;
    if (quantity <= 1) {
      quantity = 1;
    } else {
      quantity = val;
    }
    update();
  }
}
