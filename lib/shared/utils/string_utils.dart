class StringUtils {
  static String getInitials(String text) {
    List<String> names = text.split(" ");
    String initials = "";
    int numWords = 2;

    if (2 < names.length) {
      numWords = names.length;
    }
    for (var i = 0; i < numWords; i++) {
      initials += '${names[i][0]}';
    }
    return initials;
  }
}
