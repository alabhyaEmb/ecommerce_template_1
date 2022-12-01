import '../../config.dart';

class ProductDetailController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController controller = TextEditingController();
  Product product = Product();
  List<Images> imagesList = [];
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

  @override
  void onReady() {
    // TODO: implement onReady
    product = productList;
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
    int val = product.quantity!;
    val++;
    product.quantity = val;
    update();
  }

  //on quantity decrease
  quantityDecrease() {
    int val =product.quantity!;
    val--;
    if (product.quantity! <= 1) {
      product.quantity = 1;
    } else {
      product.quantity = val;
    }
    update();
  }
}
