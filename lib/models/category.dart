class Category {
  String _name;
  Function _onPress;
  List<Category> _sub_categories;
  String _imgSrc;

  String get name => _name;
  String get imgSrc => _imgSrc;
  List<Category> get sub_categories => _sub_categories;
  Function get onPress => _onPress;

  set name(String name) {
    _name = name;
  }

  set imgSrc(String imgSrc) {
    _imgSrc = imgSrc;
  }

  set sub_categories(List<Category> sub_categories) {
    _sub_categories = sub_categories;
  }

  set onPress(Function onPress) {
    _onPress = onPress;
  }

  // Constructor, with syntactic sugar for assignment to members.
  Category(
    this._name,
    this._imgSrc,
    this._onPress,
    this._sub_categories,
  ) {}
}
