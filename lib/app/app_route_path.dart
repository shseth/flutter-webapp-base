class AppRoutePath {
  final String pathName;
  final bool isUnknown;

  AppRoutePath.home() : pathName = "", isUnknown = false;
  AppRoutePath.other(this.pathName) : isUnknown = false;
  AppRoutePath.unknown() : pathName = "", isUnknown = true;

  bool get isHomePage => pathName == "" && isUnknown == false;
  bool get isOtherPage => pathName != "" && isUnknown == false;
  bool get isUnknownPage => pathName == "" && isUnknown == true;
}