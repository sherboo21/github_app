String svgIconsName(String? image) {
  return 'assets/icons/$image.svg';
}

String pngImageName(String? image) {
  return 'assets/images/$image.png';
}

class AppIcons {
  static String get searchIcon => svgIconsName('search');
  static String get filterIcon => svgIconsName('filter');
  static String get fileIcon => svgIconsName('file');
}

class AppImages {
  static String get backGround => pngImageName('background');
}
