extension ApiConstants on String {
  static const String  BASE_URL = "https://jsonplaceholder.typicode.com";

  static const String GET_PHOTO="/photos";

  String appendUrl(String methodName) {
    return BASE_URL + methodName;
  }

}
