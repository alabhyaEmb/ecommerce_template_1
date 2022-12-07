class CommonUtils {
  static String getInitials(String string) {
    List<String> str = string.split(' ');
    String newInitials = '';

    if (str.length == 1) {
      newInitials = str[0].split('')[0] + str[0].split('')[1];
    } else {
      if (str.length > 1) {
        newInitials = str[0].split('').first + str[1].split('').first;
      }
    }
    return newInitials.toUpperCase();
  }

  static String convertListToString(List<int> productIds) {
    String s = '';
    for (int i = 0; i < productIds.length; i++) {
      s = s + productIds[i].toString();
      if (i == productIds.length - 1) {
        continue;
      }
      s = '$s,';
    }
    return s;
  }

  static double findDiscountPercentage(
      {required String smallNumber, required String greaterNumber}) {
    double percentageOff = 0;

    double priceDiff = double.parse(greaterNumber) - double.parse(smallNumber);
    percentageOff = (priceDiff / double.parse(greaterNumber)) * 100;

    return percentageOff;
  }
}
