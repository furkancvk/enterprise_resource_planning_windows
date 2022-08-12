class Helpers {
  static String capitalize(String word){
    String result = "";
    result = word[0].toUpperCase() + word.substring(1).toLowerCase();
    return result;
  }
}